class UsersController < ApplicationController

  before_action :set_user

  def edit
    authorize @user
  end

  def update
    authorize @user

    if params[:user][:password].blank?
      params[:user][:password] = nil
      params[:user][:password_confirmation] = nil if params[:user][:password_confirmation].blank?
    end

    if @user.update user_params
      redirect_to root_path
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email, :password, :password_confirmation)
  end
end
