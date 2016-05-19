class ApplicationFormsController < ApplicationController

  before_action :authenticate_user!

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
    @application.user = current_user
    @posts = Post.all
    @citizens = Citizen.all
  end

  def create
    @posts = Post.all
    @citizens = Citizen.all
    @application = Application.new
    @application.status = 'Status'
    @application.submission_date = Time.now
    @application.post_of_residence = Post.find(params[:post_of_residence_id])

    if @application.save
      redirect_to action: :index, notice: t('activerecord.attributes.application.messages.create.created')
    else
      render :new
    end
  end

  def application_params

    params.require(:application).permit(:maiden_name, user_attributes: [:maiden_name])
  end


end