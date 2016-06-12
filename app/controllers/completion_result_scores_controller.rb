class CompletionResultScoresController < ApplicationController
  before_action :set_completion
  before_action :set_result, only: [:edit, :update, :destroy]

  layout 'home'

  def index
    @results = @completion.user_highschool_completions.search(params[:search]).joins(:user).includes(:user)
                   .order('users.lastname').page(params[:page])
  end

  def new
    @result = UserHighschoolCompletion.new
    @result.highschool_completion = @completion
  end

  def create
    @result = UserHighschoolCompletion.new score_params
    @result.highschool_completion = @completion

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
  def set_completion
    @completion = HighschoolCompletion.find(params[:completion_result_id])
  end

  def set_result
    @result = @completion.user_highschool_completions.find(params[:id])
  end

  def score_params
    params.require(:user_highschool_completion).permit(:passed, :user_id)
  end
end
