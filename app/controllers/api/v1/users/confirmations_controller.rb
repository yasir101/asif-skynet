module Api
  module V1
    module Users
      class ConfirmationsController < Devise::ConfirmationsController
        include Response
        include CustomException
        handle_api_errors
        skip_before_action :verify_authenticity_token

        def create
          self.resource = resource_class.confirm_by_token(params[:user][:confirmation_token])

          if resource.errors.empty?
            json_response({ 'message': 'Email confirmed successfully' }, 200)
          else
            raise_error('Unprocessable Entity', resource.errors.full_messages.join, 422)
          end
        end
      end
    end
  end
end
