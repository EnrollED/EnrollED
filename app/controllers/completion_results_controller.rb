class CompletionResultsController < ApplicationController

  layout 'home'

  def index
    @completions = HighschoolCompletion.where(is_valid: true).search(params[:search]).page(params[:page])
  end
end
