class ApplicationPolicy < BasePolicy

  def index?
    true
  end

  def all_applications?
    (@user.has_role? :admissions) or (@user.has_role? :admin)
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