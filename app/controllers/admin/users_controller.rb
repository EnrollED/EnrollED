class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    authorize User

    @users = User.where(disabled_at: nil).search(params[:search]).order(:username).page(params[:page])
  end

  # GET /tests/new
  def new
    authorize User

    @user = User.new
  end

  # GET /tests/1/edit
  def edit
    authorize @user
  end

  # POST /tests
  # POST /tests.json
  def create
    authorize User

    @user = User.new user_params

    if @user.save
      redirect_to action: :index, notice: 'User was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    authorize @user

    if params[:user][:password].blank?
      params[:user][:password] = nil
      params[:user][:password_confirmation] = nil if params[:user][:password_confirmation].blank?
    end

    print params

    if @user.update user_params
      redirect_to action: :index, notice: 'User updated successfully!'
    else
      render :edit
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    authorize @user

    @user.disable

    redirect_to admin_users_path, notice: 'User was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:user).permit(:username, :firstname, :lastname, :email)
  end
end
