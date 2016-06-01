class StudyProgramModePolicy < BasePolicy

  def index?
    (@user.has_role? :admissions) or (@user.has_role? :admin) or
        (@user.has_role?(:member, @record.higher_education_institution))
  end
end