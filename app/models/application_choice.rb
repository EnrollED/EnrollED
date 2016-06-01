class ApplicationChoice < ActiveRecord::Base
  belongs_to :application
  belongs_to :study_program_mode

  def self.advanced_search(faculty = nil, program = nil, type = nil, mode = nil)
    choices = self

    choices = choices.where(study_programs: {higher_education_institution_id: faculty}) unless faculty.nil? or faculty.empty?
    choices = choices.where(study_program_modes: {study_program_id: program}) unless program.nil? or program.empty?
    choices = choices.where(study_programs: {type_of_study_id: type}) unless type.nil? or type.empty?
    choices = choices.where(study_program_modes: {mode_of_study_id: mode}) unless mode.nil? or mode.empty?

    choices
  end
end