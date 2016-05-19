class ApplicationChoice < ActiveRecord::Base
  belongs_to :application
  belongs_to :study_program_mode
end