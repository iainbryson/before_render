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

AbstractController::Rendering.prepend Rails5BeforeRender::BeforeRenderInstance
