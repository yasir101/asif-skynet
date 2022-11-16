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
    resources :countries
    resources :cities
    resources :areas
    resources :sub_areas do
      collection do
        get :get_sub_areas
      end
    end
    resources :staffs do
      collection do
        get :archived
      end
      member do
        get :restore
      end
    end
    resources :payments
    resources :receipt_books do
      collection do
        get :book_pages
      end
    end
    resources :message_templates
    resources :messages
    resources :companies

    resources :purchase_packages do
      collection do
        get :purchase_packages_list
      end
    end
    
    resources :packages do
      collection do
        get :customer_package_list
      end
    end
    resources :customers do 
      collection do
        get :check_username
        get :export_profile
      end
      member do
        get :settings
      end
      resources :subscriptions
    end
    
    resources :receivings do
      collection do
        get :search_customer
      end
    end
  end

  # root to: 'home#index'
end
