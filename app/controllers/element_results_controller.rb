class ElementResultsController < ApplicationController
  layout 'home'

  def index
    @elements = Element.where(is_valid: true).search(params[:search]).page(params[:page])
  end
end
