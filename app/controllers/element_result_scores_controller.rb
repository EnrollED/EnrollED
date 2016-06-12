class ElementResultScoresController < ApplicationController
  before_action :set_element
  before_action :set_result, only: [:edit, :update, :destroy]

  layout 'home'

  def index
    @results = @element.user_elements.search(params[:search]).joins(:user).includes(:user).page(params[:page])
  end

  def new
    @result = UserElement.new
    @result.element = @element
  end

  def create
    @result = UserElement.new score_params
    @result.element = @element

    if @result.save
      redirect_to action: :index, notice: 'Ocena je bila uspešno dodana'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @result.update score_params
      redirect_to action: :index, notice: 'Ocena je bila uspešno posodobljena'
    else
      render :edit
    end
  end

  def destroy
    @result.destroy

    redirect_to action: :index, notice: 'Ocena je bila uspešno izbrisana'
  end

  private
  def set_element
    @element = Element.find(params[:element_result_id])
  end

  def set_result
    @result = @element.user_elements.find(params[:id])
  end

  def score_params
    params.require(:user_element).permit(:score, :user_id)
  end
end
