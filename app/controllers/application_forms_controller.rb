class ApplicationFormsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_enrollment, only: [:new, :create, :edit, :update]
  before_action :set_application, only: [:update, :edit]

  def index
    @applications = Application.all
  end

  def new
    @application = Application.new
    @application.user = current_user
  end

  def create
    @application = Application.new application_params
    @application.user = current_user
    @application.status = 'Nepopolna'
    submission_date = Time.now
    if @enrollment.end < submission_date
      redirect_to application_forms_path, notice: t('activerecord.attributes.application.messages.create.submission_date_too_late')
      return
    end
    @application.enrollment = @enrollment
    @application.submission_date = Time.now
    @application.application_number = generateAppNumber


    if @application.save
      redirect_to new_application_form_choice_path(@application)
    else
      render new_application_form_path
    end
  end

  def edit
    if @application.status == 'Poslana'
      redirect_to application_forms_path, notice: 'Prijave ni mogoče spreminjati, saj je bila poslana vpisni službi!'
    end
  end

  def update

    if @application.update application_params
      @applicationChoice = ApplicationChoice.where(application_id: @application.id, choice: 1).first
      redirect_to edit_application_form_choice_path(@application, @applicationChoice)
    else
      render edit_application_form_path
    end
  end

  def destroy
    @application = Application.find(params[:id])
    @application.destroy

    redirect_to application_forms_path, notice: "Prijava je odstanjena!"
  end

  def application_params

    params.require(:application).permit(:maiden_name, :EMSO, :sex, :phone, :place_of_residence, :post_of_residence_id, :municipality_id, :country_of_birth_id, :highschool_id, :highschool_certificate, :highschool_country_id,
                                        :firstname_for_notification, :lastname_for_notification, :place_for_notification, :post_for_notification_id, :citizen_id, :country_of_residence_id, :highschool_completion_id)
  end

  def set_enrollment
    @enrollment = Enrollment.find_by_current(true)
  end

  def set_application
    @application = Application.find(params[:id])
  end

  def generateAppNumber
    return Time.now.year.to_s + '-' + rand(999999).to_s
  end

  def show
    @application = Application.find(params[:id])
    if @application.update(:status => 'Poslana')
      redirect_to application_forms_path, notice: 'Prijava je bila poslana vpisni službi!'
    else
      redirect_to application_forms_path, notice: 'Prišlo je do napake pri pošiljanju prijave vpisni službi!'
    end
  end

end