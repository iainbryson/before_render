# frozen_string_literal: true

require 'action_controller'

module Rails5BeforeRender
  module BeforeRenderInstance
    def render(*args, &blk)
      run_callbacks :render do
        super
      end
    end
  end
end

ActionController::Base.prepend Rails5BeforeRender::BeforeRenderInstance
