class AddAditionAttributesToStudyProgramMode < ActiveRecord::Migration
  def change
    add_column :study_program_modes, :number_of_places_foreign, :integer
    add_column :study_program_modes, :number_of_places_after_selection_foreign, :integer
    add_column :study_program_modes, :selected, :integer
    add_column :study_program_modes, :selected_foreign, :integer
  end
end
