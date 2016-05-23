class ApplicationPolicy < BasePolicy
  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if (@user.has_role? :admissions) or (@user.has_role? :admin)
        scope.all
      else
        scope.where(user_id: @user.id)
      end
    end
  end

  def index?
    true
  end

  def show?
    (@user.has_role? :admissions) or (@user.has_role? :admin) or @record.user == @user
  end

  def edit?
    update?
  end

  def new?
    create?
  end

  def create?
    (@user.has_role? :admissions) or (@user.has_role? :admin) or (@record.user == @user and @record.enrollment.end > Time.now)
  end

  def update?
    (@user.has_role? :admissions) or (@user.has_role? :admin) or (@record.user == @user and @record.status != 'Poslana')
  end

  def destroy?
    update?
  end

  def send_application?
    show?
  end
end