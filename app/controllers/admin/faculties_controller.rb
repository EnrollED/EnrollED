class Admin::FacultiesController < ApplicationController

  before_action :set_user, only: [:index, :create, :destroy]

  layout 'admin'

  def index
    authorize @user, :edit_faculties?

    @faculties = HigherEducationInstitution.with_role(:member, @user).order(:name).page(params[:page])
    @available_faculties = HigherEducationInstitution.order(:name).all
  end

  def create
    authorize @user, :edit_faculties?

    faculty = HigherEducationInstitution.find(params[:faculty_id]) rescue (return redirect_to(action: :index))

    if @user.add_role :member, faculty
      redirect_to action: :index, notice: t('admin.faculties.create.success')
    else
      redirect_to action: :index, alert: t('admin.faculties.create.failed')
    end
  end

  def destroy
    authorize @user, :edit_faculties?

    faculty = HigherEducationInstitution.find(params[:id])

    if @user.remove_role :member, faculty
      redirect_to action: :index, notice: t('admin.faculties.destroy.success')
    else
      redirect_to action: :index, alert: t('admin.faculties.destroy.failed')
    end
  end

  private
  def set_user
    @user = User.find(params[:user_id])
  end
end
