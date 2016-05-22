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
    if !check_municipality_country
      redirect_to new_application_form_path, notice: t('activerecord.attributes.application.messages.create.wrong_country_municipality')
      return
    end
    print 'Veronika'
    print params[:application][:highschool_certificate]

    @application = Application.new application_params
    @application.user = current_user
    @application.status = 'Status'

    submission_date = Time.now
    if @enrollment.end < submission_date
      redirect_to application_forms_path, notice: t('activerecord.attributes.application.messages.create.submission_date_too_late')
      return
    end
    @application.enrollment = @enrollment
    @application.submission_date = Time.now
    @application.application_number = generateNumber


    if @application.save
      redirect_to application_forms_path, notice: t('activerecord.attributes.application.messages.create.created')
    else
      render new_application_form_path
    end
  end

  def edit
  end

  def update
    if !check_municipality_country
      redirect_to edit_application_form_path, notice: t('activerecord.attributes.application.messages.create.wrong_country_municipality')
      return
    end
    if @application.update application_params
      redirect_to application_forms_path, notice: "Prijava je bila uspešno posodobljena!"
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

    params.require(:application).permit(:maiden_name, :EMSO, :sex, :phone, :place_of_residence, :post_of_residence_id, :municipality_id, :country_of_birth_id, :highschool_id, :highschool_certificate, :highschool_country_id, :date_of_birth,
                                        :firstname_for_notification, :lastname_for_notification, :place_for_notification, :post_for_notification_id, :citizen_id, :country_of_residence_id, :highschool_completion_id)
  end

  def set_enrollment
    @enrollment = Enrollment.find_by_current(true)
  end

  def set_application
    @application = Application.find(params[:id])
  end

  def generateNumber
    return Time.now.year.to_s + '-' + rand(999999).to_s
  end

  def check_municipality_country
    if (Municipality.find(params[:application][:municipality_id]).code.eql?('0') and Country.find(params[:application][:country_of_birth_id]).code.eql?('705')) or (Municipality.find(params[:application][:municipality_id]).code != '0' and Country.find(params[:application][:country_of_birth_id]).code != '705')
      return false
    end
    return true
  end



end