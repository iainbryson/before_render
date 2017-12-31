require 'test_helper'

class SampleController < ActionController::Base
    if ActionController::Base.respond_to?(:before_render)
        before_filter :action_one
        after_filter :action_three
        before_render :action_two, :except => [:new]
    end
    if ActionController::Base.respond_to?(:skip_before_render)
        skip_before_render :action_two, :only => [:show]
    end
    if ActionController::Base.respond_to?(:prepend_before_render)
        prepend_before_render :action_two, :only => [:update]
    end

    attr_accessor :actions

    def index;  render :text => ''; end
    def new;    render :text => ''; end
    def show;   render :text => ''; end
    def update; render :text => ''; end

    def reset_actions
        @actions = ''
    end

    private
    def action_one
        @actions << 'a'
    end
    def action_two
        @actions << 'b'
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
                match ':controller(/:action)'
            end
            process :index
        end
        assert_equal @controller.actions, 'abc'
    end

    def test_before_render_except_option
        with_routing do |set|
            set.draw do
                match ':controller(/:action)'
            end
            process :new
        end
        assert_equal @controller.actions, 'ac'
    end

    def test_skip_before_render
        with_routing do |set|
            set.draw do
                match ':controller(/:action)'
            end
            process :show
        end
        assert_equal @controller.actions, 'ac'
    end

    def test_prepend_before_render
        with_routing do |update|
            set.draw do
                match ':controller(/:action)'
            end
            process :update
        end
        assert_equal @controller.actions, 'bac'
    end

end
