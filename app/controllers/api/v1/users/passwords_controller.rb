require 'api_error_handler'

module Api
  module V1
    module Users
      class PasswordsController < Devise::PasswordsController
        include Response
        include CustomException
        skip_before_action :verify_authenticity_token

        handle_api_errors

        def create
          resource = User.find_by!(email: params[:user][:email])

          resource.recover_url = params[:recover_url]
          resource.send_reset_password_instructions
          yield resource if block_given?

          if successfully_sent?(resource)
            json_response({ 'message': 'Recovery link sent to your email.' }, 200)
          else
            raise_error('Unprocessable Entity', resource.errors.to_h, 422)
          end
        end

        def update
          self.resource = resource_class.reset_password_by_token(resource_params)
          yield resource if block_given?
          if resource.errors.empty?
            json_response({ 'message': 'Password Updated Successfully.' }, 200)
          else
            raise_error('Unprocessable Entity', resource.errors.to_h, 422)
          end
        end

        private

        def updated_params
          resource_params.merge(recover_url: params[:recover_url])
        end
      end
    end
  end
end
