class StudyProgram < ActiveRecord::Base
  belongs_to :higher_education_institution
  belongs_to :type_of_study
  belongs_to :enrollment
  has_many :study_program_modes, :dependent => :destroy
  validates :name, presence: true
  validates :code, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true, length: {in: 2..100}

  def fac_name
    self.higher_education_institution.name
  end

  def full_name
    self.higher_education_institution.acronym + ' - ' + self.name + ' (' + self.type_of_study.name + ')'
  end

  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      find(:all)
    end
  end

  def self.advanced_search(faculty = nil, type = nil, mode = nil)
    programs = self

    programs = programs.where(higher_education_institution_id: faculty) unless faculty.nil? or faculty.empty?
    programs = programs.where(type_of_study_id: type) unless type.nil? or type.empty?
    programs = programs.where(study_program_modes: {mode_of_study_id: mode}) unless mode.nil? or mode.empty?

    programs
  end
end