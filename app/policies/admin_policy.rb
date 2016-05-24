class AdminPolicy < BasePolicy

  def index?
    @user.has_role?(:admin)
  end
end