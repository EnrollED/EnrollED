class StudyProgramMode < ActiveRecord::Base
  belongs_to :study_program
  belongs_to :mode_of_study

  validates :mode_of_study_id, uniqueness: {scope: [:study_program_id]}
  validates :number_of_places, presence: true
  validates :number_of_places_foreign, presence: true

  def study_program_choice
    mode_name = ModeOfStudy.find(mode_of_study_id).name
    program = StudyProgram.find(study_program_id)
    university_name = program.higher_education_institution.university.name
    faculty_name = program.higher_education_institution.name
    program_name = program.name
    "#{university_name}, #{faculty_name}, #{program_name}, #{mode_name} "
  end

end
