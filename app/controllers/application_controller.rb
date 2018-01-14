class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :duty, :nickname, :email, :password, :password_confirmation, :remember_me, :user_face, :user_face_cache])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :duty, :nickname, :email, :password, :password_confirmation, :current_password, :user_face, :user_face_cache])
  end
end
