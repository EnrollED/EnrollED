class ChoicesController < ApplicationController

  before_action :set_elements, only: [:new, :create]
  before_action :set_enrollment, only: [:new, :create, :edit, :update]

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
    @application = Application.find(params[:application_form_id])
    @applicationChoiceExisting = ApplicationChoice.where(application_id: params[:application_form_id])
    @choice_number = @applicationChoiceExisting.count + 1
  end

  def create
    @applicationChoice.study_program_mode_id = params[:application_choice][:study_program_mode_id]
    @applicationChoice.choice = @choice_number.to_s
    @applicationChoice.application = @application
    @applicationChoice.save
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
    if @applicationChoice.choice == 3
      @applicationChoiceExisting = ApplicationChoice.where(application_id: params[:application_form_id])
      if @applicationChoiceExisting.count(:study_program_mode_id) > 0
        @application.status = 'Popolna'
      else
        @application.status = 'Nepopolna'
      end
      @application.save
      redirect_to application_forms_path, notice: 'Prijava je bila uspešno posodobljena!'
      return
    else
      @applicationChoiceNew = ApplicationChoice.where(application_id: params[:application_form_id], choice: @applicationChoice.choice.to_i + 1).first
      if @applicationChoiceNew.nil?
        redirect_to new_application_form_choice_path(@application)
      else
        redirect_to edit_application_form_choice_path(@application, @applicationChoiceNew)
      end
    end
  end

  def set_enrollment
    @enrollment = Enrollment.find_by_current(true)
  end

end