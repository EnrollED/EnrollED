class CandidatesController < ApplicationController
  layout 'home'

  def index
    @candidates = Application.includes(:user).page(params[:page]).per(10)
    @application_choices = ApplicationChoice.all
  end
end