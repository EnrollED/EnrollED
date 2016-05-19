class CreateStudyProgramModes < ActiveRecord::Migration
  def change
    create_table :study_program_modes, id: :uuid do |t|
      t.integer  :number_of_places
      t.integer  :number_of_places_foreign
      t.integer  :number_of_places_after_selection
      t.integer  :number_of_places_after_selection_foreign
      t.integer  :selected
      t.integer  :selected_foreign
      t.float    :selection_limit

      t.references :study_program, type: :uuid
      t.references :mode_of_study, type: :uuid

      t.timestamps null: false
    end
  end
end
