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
    @user != @record && @user.has_role?(:admin)
  end

  def change_role?
    destroy?
  end

  def permitted_attributes
    if @user.has_role?(:admin) && @user != @record
      [:username, :firstname, :lastname, :email, role_ids: []]
    else
      [:username, :firstname, :lastname, :email]
    end
  end
end