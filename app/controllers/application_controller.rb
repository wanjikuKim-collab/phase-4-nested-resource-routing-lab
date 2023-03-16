class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response


    private

    def render_not_found_response
        @model_name = controller_name.classify
        render json: {errors: "#{@model_name} not found"}, status: :not_found
    end
end
