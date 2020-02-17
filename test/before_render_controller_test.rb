# frozen_string_literal: true

require 'test_helper'

class SampleController < ApplicationController
  before_action :action_one
  after_action :action_three
  before_render :action_two_a, except: [:new] if ActionController::Base.respond_to?(:before_render)
  skip_before_render :action_two_a, only: [:show] if ActionController::Base.respond_to?(:skip_before_render)
  prepend_before_render :action_two_b, only: [:update] if ActionController::Base.respond_to?(:prepend_before_render)

  attr_accessor :actions

  def index
    render plain: 'index'
    end

  def new
    render plain: 'new'
    end

  def show
    render plain: 'show'
    end

  def update
    render plain: 'update'
    end

  def reset_actions
    @actions = ''
  end

  private

  def action_one
    @actions << 'a'
  end

  def action_two_a
    @actions << 'b'
  end

  def action_two_b
    @actions << 'B'
  end

  def action_three
    @actions << 'c'
  end
end

class SampleControllerTest < ActionController::TestCase
  setup do
    @request.env['REQUEST_METHOD'] = 'GET'
    @request.action = 'index'

    @controller.reset_actions
  end

  def test_before_render_in_place
    with_routing do |set|
      set.draw do
        get 'sample/index'
      end
      process :index
    end
    assert_equal 'abc', @controller.actions
  end

  def test_before_render_except_option
    with_routing do |set|
      set.draw do
        get 'sample/new'
      end
      process :new
    end
    assert_equal 'ac', @controller.actions
  end

  def test_skip_before_render
    with_routing do |set|
      set.draw do
        get 'sample/show'
      end
      process :show
    end
    assert_equal 'ac', @controller.actions
  end

  def test_prepend_before_render
    with_routing do |update|
      update.draw do
        get 'sample/update'
      end
      process :update
    end
    assert_equal 'aBbc', @controller.actions
  end
end
