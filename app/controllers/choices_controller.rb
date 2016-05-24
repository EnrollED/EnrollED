class ChoicesController < ApplicationController

  before_action :set_elements, only: [:new, :create, :edit, :update]
  before_action :set_enrollment, only: [:new, :create, :edit, :update]

  def new
    if @choice_number == 4
      checkPopolna("Prijava je bila uspešno oddana!")
    end
  end



  def set_elements
    @applicationChoice = ApplicationChoice.new
    @application = Application.find(params[:application_form_id])
    @applicationChoiceExisting = ApplicationChoice.where(application_id: params[:application_form_id])
    @choice_number = @applicationChoiceExisting.count + 1
  end

  def create
    @applicationChoice.study_program_mode_id = params[:application_choice][:study_program_mode_id]
    @applicationChoice.choice = @choice_number.to_s
    @applicationChoice.application = @application
    @applicationChoice.save
    @applicationChoiceExisting = ApplicationChoice.where(application_id: params[:application_form_id])
    if @applicationChoice.study_program_mode_id.nil?
      @applicationChoice.destroy
      checkPopolna("Prijava je bila uspešno oddana!")
      return
    end
    redirect_to new_application_form_choice_path
  end

  def edit
    @applicationChoice = ApplicationChoice.find(params[:id])
    @choice_number = @applicationChoice.choice
  end

  def update
    @applicationChoice = ApplicationChoice.find(params[:id])
    @application = Application.find(params[:application_form_id])
    @applicationChoice.study_program_mode_id = params[:application_choice][:study_program_mode_id]
    @applicationChoice.save
    @applicationChoiceExisting = ApplicationChoice.where(application_id: params[:application_form_id])
    if @applicationChoice.study_program_mode_id.nil?
      @applicationChoice.destroy
      checkPopolna("Prijava je bila uspešno posodobljena!")
      return
    end


    @applicationChoiceNew = ApplicationChoice.where(application_id: params[:application_form_id], choice: @applicationChoice.choice.to_i + 1).first
    if @applicationChoiceNew.nil?
      redirect_to new_application_form_choice_path(@application)
    else
      redirect_to edit_application_form_choice_path(@application, @applicationChoiceNew)
    end

  end

  def set_enrollment
    @enrollment = Enrollment.find_by_current(true)
  end

  def checkPopolna(alert)
    if @applicationChoiceExisting.count(:study_program_mode_id) > 0
      @application.status = 'Popolna'
    else
      @application.status = 'Nepopolna'
    end
    @application.save
    redirect_to application_forms_path, notice: alert
  end

end