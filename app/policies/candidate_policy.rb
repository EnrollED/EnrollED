class CandidatePolicy < BasePolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if @user.has_role? :admin
        scope.includes(:user).page(params[:page]).per(10)
      elsif @user.has_role? :admissions
        scope.where(user_id: @user.id)
      end
    end
  end

  def index?
    true
  end

end