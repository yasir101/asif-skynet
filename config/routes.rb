Rails.application.routes.draw do
  default_url_options host: ENV['ASSET_PATH']
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  
  scope '/api' do
    scope '/v1' do
      use_doorkeeper do
        controllers tokens: 'api/v1/tokens'
      end
    end
  end

  scope module: :api, path: 'api' do
    scope module: :v1, path: 'v1' do
      devise_for :users, controllers: {
        registrations: 'api/v1/users/registrations',
        passwords: 'api/v1/users/passwords',
        confirmations: 'api/v1/users/confirmations'
      }
    end
  end

  root to: 'home#index'
end
