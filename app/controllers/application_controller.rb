class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  before_action :authenticate_admin!

  protected

  def after_sign_up_path_for(_resource)
    dashboard_path
  end

  def after_sign_in_path_for(_resource)
    dashboard_path
  end
end
