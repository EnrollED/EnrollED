class PostPolicy < BasePolicy

  def index?
    (@user.has_role? :admissions) or (@user.has_role? :admin)
  end

  def show?
    (@user.has_role? :admissions) or (@user.has_role? :admin)
  end

  def edit?
    update?
  end

  def new?
    create?
  end

  def create?
    (@user.has_role? :admissions) or (@user.has_role? :admin)
  end

  def update?
    (@user.has_role? :admissions) or (@user.has_role? :admin)
  end

  def destroy?
    update?
  end

  def sifranti?
    update?
  end
end