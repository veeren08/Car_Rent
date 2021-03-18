class RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]

  def create
    super
<<<<<<< HEAD
=======
    # @user = current_user
>>>>>>> 23f30da243944c32ee40375d4f5ac27e0ee52e96
    resource.add_role(params[:user][:roles])
  end

  protected

<<<<<<< HEAD
=======
  # If you have extra params to permit, append them to the sanitizer.
>>>>>>> 23f30da243944c32ee40375d4f5ac27e0ee52e96
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [roles: []])
  end

end