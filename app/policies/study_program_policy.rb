class StudyProgramPolicy < BasePolicy

  def index?
    (@user.has_role? :admissions) or (@user.has_role? :admin)
  end

  def my?
    (!User.with_role(:member, :any).where(id: @user.id).empty?) or (@user.has_role? :admin)
  end

  def show?
    (@user.has_role? :admissions) or (@user.has_role? :admin) or
        (@user.has_role?(:member, @record.higher_education_institution))
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
    (@user.has_role? :admissions) or (@user.has_role? :admin) or
        (@user.has_role?(:member, @record.higher_education_institution))
  end

  def destroy?
    update?
  end
end