# frozen_string_literal: true

require('swagger_helper')

describe 'Authentication' do
  path '/api/v1/users' do
    post 'Signup' do
      tags 'Authentication'
      security []
      consumes 'application/json'

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        email: { type: :string },
                        password: { type: :string },
                        password_confirmation: { type: :string }
                      },
                      required: %i[email password password_confirmation]
                    },
                    confirm_url: { type: :string },
                    required: %i[user confirm_url]
                  }
                }

      response '200', 'Sign up' do
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/users/confirmation' do
    post 'Confirm Email' do
      tags 'Authentication'
      security []
      consumes 'application/json'

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        confirmation_token: { type: :string }
                      },
                      required: %i[confirmation_token]
                    },
                    required: %i[user]
                  }
                }

      response '200', 'Email confirmed' do
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        run_test!
      end
    end
  end

  path '/api/v1/oauth/token' do
    post 'Login' do
      tags 'Authentication'
      security []
      consumes 'application/json'

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    email: { type: :string },
                    password: { type: :string },
                    grant_type: { type: :string, example: 'password' },
                  },
                  required: %i[email password grant_type]
                }

      response '200', 'Login' do
        let(:Authorization) { "Bearer #{generate_token}" }
        run_test!
      end

      response '422', 'Invalid request' do
        run_test!
      end
    end
  end

  path '/api/v1/users/password' do
    post 'Forgot Password' do
      tags 'Authentication'
      security []
      consumes 'application/json'

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        email: { type: :string }
                      },
                      required: %i[email]
                    },
                    recover_url: { type: :string },
                    required: %i[user recover_url]
                  }
                }

      response '200', 'Email Sent' do
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        run_test!
      end
    end
  end

  path '/api/v1/users/password' do
    put 'Reset Password' do
      tags 'Authentication'
      security []
      consumes 'application/json'

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    user: {
                      type: :object,
                      properties: {
                        password: { type: :string },
                        password_confirmation: { type: :string },
                        reset_password_token: { type: :string }
                      },
                      required: %i[email]
                    },
                    required: %i[user]
                  }
                }

      response '200', 'Password Reset' do
        run_test!
      end

      response '422', 'Unprocessable Entity' do
        run_test!
      end
    end
  end

  path '/api/v1/oauth/revoke' do
    post 'Revoke Token' do
      tags 'Authentication'
      security [bearerAuth: []]

      parameter name: :user,
                in: :body,
                schema: {
                  type: :object,
                  properties: {
                    token: { type: :string }
                  },
                  required: %i[token]
                }

      response '200', 'Token Revocked Successfully' do
        run_test!
      end

      response '403', 'Unotherized Token' do
        run_test!
      end
    end
  end
end
