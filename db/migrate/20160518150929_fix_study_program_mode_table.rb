class FixStudyProgramModeTable < ActiveRecord::Migration
  def change
    drop_table :study_program_modes
    create_table :study_program_modes, id: :uuid do |t|
      t.references  :study_program, type: :uuid
      t.references  :mode_of_study, type: :uuid

      t.integer  :number_of_places
      t.integer  :number_of_places_foreign
      t.integer  :number_of_places_after_selection
      t.integer  :number_of_places_after_selection_foreign
      t.integer  :selected
      t.integer  :selected_foreign
      t.float    :selection_limit

      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
    end
  end
end
