class StudyProgram < ActiveRecord::Base
  belongs_to :higher_education_institution
  belongs_to :type_of_study
end