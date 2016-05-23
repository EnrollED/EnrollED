class UserPolicy < ApplicationPolicy

  def index?
    @user.has_role? :admin
  end

  def create?
    @user.has_role? :admin
  end

  def new?
    create?
  end

  def update?
    @user == @record || @user.has_role?(:admin)
  end

  def edit?
    update?
  end

  def destroy?
    @user == @record || @user != @record && @user.has_role?(:admin)
  end

  def cancel?
    @user == @record
  end

  def change_role?
    @user != @record && @user.has_role?(:admin)
  end

  def change_pass?
    @user == @record
  end

  def edit_faculties?
    index?
  end

  def permitted_attributes
    if change_role?
      [:username, :firstname, :lastname, :email, role_ids: []]
    elsif change_pass?
      [:username, :firstname, :lastname, :email, :password, :password_confirmation]
    else
      [:username, :firstname, :lastname, :email]
    end
  end
end