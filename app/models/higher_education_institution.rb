class HigherEducationInstitution < ActiveRecord::Base
  belongs_to :university
  belongs_to :municipality
end