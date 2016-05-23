class Admin::UsersController < ApplicationController

  before_action :set_user, only: [:edit, :update, :destroy]
  before_action :set_roles, except: [:index, :destroy]

  layout 'admin'

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
    authorize :admin, :index?
  end

  # POST /tests
  # POST /tests.json
  def create
    authorize User

    @user = User.new permitted_attributes(User)

    if @user.save
      redirect_to action: :index, notice: t('admin.users.create.created')
    else
      render :new
    end
  end

  # PATCH/PUT /tests/1
  # PATCH/PUT /tests/1.json
  def update
    authorize @user
    authorize :admin, :index?

    if params[:user][:password].blank?
      params[:user][:password] = nil
      params[:user][:password_confirmation] = nil if params[:user][:password_confirmation].blank?
    end

    if @user.update permitted_attributes(@user)
      redirect_to action: :index, notice: t('admin.users.update.updated')
    else
      render :edit
    end
  end

  # DELETE /tests/1
  # DELETE /tests/1.json
  def destroy
    authorize @user

    @user.disable

    redirect_to admin_users_path, notice: t('admin.users.destroy.disabled')
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def set_roles
    @roles = Role.where(resource: nil)
  end
end
