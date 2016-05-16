class StudyProgramMode < ActiveRecord::Base
  belongs_to :study_program
  belongs_to :mode_of_study
end
