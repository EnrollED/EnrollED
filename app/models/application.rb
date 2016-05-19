class Application < ActiveRecord::Base
  belongs_to :user
  belongs_to :enrollment
  belongs_to :highschool
  belongs_to :study_program
end