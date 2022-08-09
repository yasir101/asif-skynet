class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_admin!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
  
  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: [:login, :password]
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
