module Api
  module V1
    class TokensController < Doorkeeper::TokensController
      before_action :check_if_account_is_registered, only: :create

      private

      def check_if_account_is_registered
        user = User.find_by(email: params['email'])
        render json: unregistered_account_error, status: 401 unless user
      end

      def unregistered_account_error
        { title: 'User not registered', detail: 'This user is not registered, please register' }
      end
    end
  end
end
