class ApplicationController < ActionController::Base

    before_action :configure_permitted_parameters, if: :devise_controller?
    protected
        def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up, keys: [:email, :first_name, :last_name, :dateofbirth, :mobile, :city, :country, :zipcode, :address, :password])
            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :first_name, :last_name, :dateofbirth, :mobile, :city, :country, :zipcode, :address, :current_password)}
        end


    def after_sign_in_path_for(resource)
      if @user.has_role? :owner
        owners_path
      elsif @user.has_role? :admin
        admins_path
      else
        root_path
      end
    end
    
end 
