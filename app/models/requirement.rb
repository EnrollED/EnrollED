class Requirement < ActiveRecord::Base
  belongs_to :study_program
  belongs_to :highschool_completion
  belongs_to :profession
end
