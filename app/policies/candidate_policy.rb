class CandidatePolicy < BasePolicy

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if @user.has_role? :admin or @user.has_role? :admissions
        @higher_education_institution = HigherEducationInstitution.with_role(:member, @user)
        if @higher_education_institution.nil?
          scope.includes(:user)
        else
          print "lalalalal"
          print @higher_education_institution.ids
          scope.includes({study_program_mode: {study_program: [:higher_education_institution]}}).where({study_programs: {higher_education_institution_id: @higher_education_institution.ids}})
        end
      end
    end
  end

  def index?
    true
  end

end