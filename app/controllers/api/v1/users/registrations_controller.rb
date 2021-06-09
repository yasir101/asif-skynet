# frozen_string_literal: true

require 'api_error_handler'

module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        skip_before_action :verify_authenticity_token
        include Response
        include CustomException
        handle_api_errors

        def create
          build_resource(sign_up_params)

          resource.confirm_url = params[:confirm_url]

          resource.save
          if resource.persisted?
            expire_data_after_sign_in! unless resource.active_for_authentication?
            json_response({ customer: resource, message: 'Confirmation email is sent to your email. Please check.' }, 200)
          else
            raise_error('Validation failed', resource.errors.to_h, 422)
          end
        end

        private

        def sign_up_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
end
