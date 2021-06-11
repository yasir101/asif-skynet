require('sidekiq/web')

Rails.application.routes.draw do
  default_url_options host: ENV['ASSET_PATH']
  
  #Sidekiq Routes
  mount Sidekiq::Web => '/sidekiq'
  
  #Swagger Routes
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # Admin Devise Routes
  devise_for :admins, controllers: {
    registrations: 'app/admins/registrations',
    passwords: 'app/admins/passwords',
    confirmations: 'app/admins/confirmations'
  }

  devise_scope :admin do
    authenticated :admin do
      root 'app/dashboards#show', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # API Routes
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
      }, scoped_views: 'api/v1/users'
    end
  end

  # APP Routes
  scope module: :app, path: 'app' do
    resource :dashboard, only: [:show]
  end

  # root to: 'home#index'
end
