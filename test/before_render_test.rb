# frozen_string_literal: true

require 'test_helper'

class BeforeRenderTest < Minitest::Test
  def test_before_render
    assert ActionController::Base.respond_to?(:before_render)
  end

  def test_skip_before_render
    assert ActionController::Base.respond_to?(:skip_before_render)
  end

  def test_prepend_before_render
    assert ActionController::Base.respond_to?(:prepend_before_render)
  end
end
