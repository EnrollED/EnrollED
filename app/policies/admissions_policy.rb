class AdmissionsPolicy < BasePolicy

  def index?
    @user.has_role?(:admissions)
  end
end