require 'action_controller'

module Rails5BeforeRender
    module BeforeRenderInstance
        extend ActiveSupport::Concern

        included do
            define_callbacks :render, skip_after_callbacks_if_terminated: true,
                             terminator: ->(controller, lambda) do
                                 lambda.call if lambda.is_a?(Proc)
                                 controller.performed?
                             end
        end

        def render(*opts, &blk)
            run_callbacks :render do
                super(*opts, &blk)
            end
        end

    end
end

ActionController::Base.send :prepend, Rails5BeforeRender::BeforeRenderInstance
