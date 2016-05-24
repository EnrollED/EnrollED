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
end