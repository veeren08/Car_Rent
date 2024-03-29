class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :configure_permitted_parameters, if: :devise_controller?
  # include LoadAndAuthorizeResource
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:profile_avatar, :email, :first_name, :last_name, :dateofbirth, :mobile, :city, :country, :zipcode, :address, :password])
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:profile_avatar, :email, :first_name, :last_name, :dateofbirth, :mobile, :city, :country, :zipcode, :address, :current_password)}
  end

  def after_sign_in_path_for(resource)
    root_path
  end
end 
