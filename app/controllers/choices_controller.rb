class ChoicesController < ApplicationController

  before_action :set_elements, only: [:new, :create]

  def new
    if @choice_number == 4
      if @applicationChoiceExisting.count(:study_program_mode_id) > 0
        @application.status = 'Popolna'
      else
        @application.status = 'Nepopolna'
      end
      @application.save
      redirect_to application_forms_path, notice: "Prijava je bila uspešno oddana!"
    end
  end

  def set_elements
    @applicationChoice = ApplicationChoice.new
    @enrollment = Enrollment.find_by_current(true)
    @application = Application.find(params[:application_form_id])
    @applicationChoiceExisting = ApplicationChoice.where(application_id: params[:application_form_id])
    @choice_number = @applicationChoiceExisting.count + 1


  end

  def create
    @applicationChoice.study_program_mode_id = params[:application_choice][:study_program_mode][:study_program_mode_id]
    @applicationChoice.choice = @choice_number.to_s
    @applicationChoice.application = @application
    @applicationChoice.save
    redirect_to new_application_form_choice_path

  end

  def edit
    @enrollment = Enrollment.find_by_current(true)
    @applicationChoice = ApplicationChoice.find(params[:id])

  end
end