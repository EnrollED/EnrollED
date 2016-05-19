class StudyProgramPolicy < ApplicationPolicy

  def index?
    @user.has_role? :admissions
  end

  def show?
    @user.has_role? :admissions
  end

  def edit?
    @user.has_role? :admissions
  end

  def create?
    @user.has_role? :admissions
  end

  def update?
    @user.has_role? :admissions
  end

  def destroy?
    @user.has_role? :admissions
  end
end