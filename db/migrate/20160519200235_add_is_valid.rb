class AddIsValid < ActiveRecord::Migration

    def change
      add_column :higher_education_institutions, :is_valid, :boolean, default: true
      add_column :enrollments, :is_valid, :boolean, default: true
      add_column :mode_of_studies, :is_valid, :boolean, default: true
      add_column :roles, :is_valid, :boolean, default: true
      add_column :study_program_modes, :is_valid, :boolean, default: true
      add_column :study_programs, :is_valid, :boolean, default: true
      add_column :type_of_studies, :is_valid, :boolean, default: true
      add_column :universities, :is_valid, :boolean, default: true

    end
end
