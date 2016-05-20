class ChoicesController < ApplicationController

  before_action :set_enrollment, only: [:new, :create]

  def new
    @applicationChoice = ApplicationChoice.new
  end

  def set_enrollment
    @enrollment = Enrollment.find_by_current(true)
    @application = Application.find(params[:application_form_id])
    @applicationChoiceExisting = ApplicationChoice.where(application_form_id: params[:application_form_id])
    if @applicationChoiceExisting.nil?
      @choice_number = 1
    else
      @choice_number = @applicationChoiceExisting.count + 1
    end

  end

  def create
    @applicationChoice = ApplicationChoice.new choices_param
    @applicationChoice.choice = @choice_number.to_s
    @applicationChoice.application = @application
    @applicationChoice.save
    redirect_to new_application_form_choice_path

  end

  def choices_param
    params.require(:application_choice).permit(study_program_mode_attributes: [:study_program_mode_id])
  end
end