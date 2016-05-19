class StudyProgramMode < ActiveRecord::Base
  belongs_to :study_program
  belongs_to :mode_of_study
  validates :mode_of_study_id, uniqueness: {scope: [:study_program_id]}
end
