class UsersController < ApplicationController
<<<<<<< HEAD
  # load_and_authorize_resource
  
	before_action :set_user, only: [:show, :edit, :update]
=======
  before_action :set_user, only: [:show, :edit, :update]
>>>>>>> 23f30da243944c32ee40375d4f5ac27e0ee52e96

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.'}
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, {role_ids: []})
  end
<<<<<<< HEAD
end
=======
end
>>>>>>> 23f30da243944c32ee40375d4f5ac27e0ee52e96
