class ApplicationFormsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_enrollment, only: [:new, :create, :edit, :update, :index, :pdf_export, :send]
  before_action :set_application, only: [:update, :edit, :pdf_export, :send]

  layout 'home'

  def index
    authorize Application
    @applications = Application.where(user_id: current_user.id)
  end

  def all_applications
    authorize Application
    @applications = Application.all
  end

  def new
    @application = Application.new
    @application.user = current_user
    @application.enrollment = @enrollment
    authorize @application
  end

  def create

    @application = Application.new application_params

    @application.user = current_user
    @application.status = 'Nepopolna'

    if params[:application][:citizen_id] == Citizen.find_by_code(1).id
      @application.EMSO = params[:application][:EMSO]
    else
      @application.EMSO = generateEMSO

    end
    @application.enrollment = @enrollment
    @application.submission_date = Time.now
    @application.application_number = generateAppNumber

    authorize @application
    if @application.save
      redirect_to new_application_form_choice_path(@application)
    else
      render new_application_form_path
    end
  end

  def edit
    authorize @application
  end

  def update
    authorize @application
    if @application.update application_params
      @applicationChoice = ApplicationChoice.where(application_id: @application.id, choice: 1).first
      if @applicationChoice.nil?
        redirect_to new_application_form_choice_path(@application)
      else
        redirect_to edit_application_form_choice_path(@application, @applicationChoice)
      end
    else
      render edit_application_form_path
    end
  end

  def destroy
    @application = Application.find(params[:id])
    authorize @application
    if @application.status != 'Poslana'
      @application.destroy
      redirect_to application_forms_path, notice: "Prijava je odstranjena!"
    else
      redirect_to application_forms_path, notice: "Poslane prijave ni mogoče odstraniti!"
    end
  end

  def generateEMSO
    return '00' + '%011d' % rand(10 ** 10)
  end

  def application_params
    params.require(:application).permit(:maiden_name, :sex, :phone, :place_of_residence, :post_of_residence_id, :municipality_id, :country_of_birth_id, :highschool_id, :highschool_certificate, :highschool_country_id, :date_of_birth,
                                        :firstname_for_notification, :lastname_for_notification, :place_for_notification, :post_for_notification_id, :citizen_id, :country_of_residence_id, :highschool_completion_id, :highschool_finished_date, :klasius_srv_id)
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

 
  def send_application
    @application = Application.find(params[:id])
    if @application.update(:status => 'Poslana')
      redirect_to application_forms_path, notice: 'Prijava je bila poslana vpisni službi!'
    else
      redirect_to application_forms_path, notice: 'Prišlo je do napake pri pošiljanju prijave vpisni službi!'
    end
  end

  def pdf_export
    @application = Application.find(params[:id])
    @application_choices =  ApplicationChoice.where(application_id: @application.id)

    respond_to do |format|
      format.html
      format.pdf do
        #export_pdf
        html = render_to_string(:action => :pdf_export, :layout => 'layouts/layout_pdf.html.erb', :template => 'application_forms/pdf_export.html.erb')
        pdf = WickedPdf.new.pdf_from_string(html)
        send_data(pdf,
                  :filename    => "prijava_"+ (@application.application_number) +".pdf",
                  :disposition => 'attachment')
      end
    end
  end

end