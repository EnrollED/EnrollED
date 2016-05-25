class Requirement < ActiveRecord::Base
  belongs_to :study_program
  belongs_to :highschool_completion
  belongs_to :profession

  validates :study_program_id, presence: true
  validates :highschool_completion_id, presence: true, uniqueness: {scope: [:study_program_id]}
end
