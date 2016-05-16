class CreateStudyProgramModes < ActiveRecord::Migration
  def change
    create_table :study_program_modes do |t|
      t.integer :number_of_places
      t.integer :number_of_places_after_selection
      t.float :selection_limit

      t.references :study_program, id: :uuid
      t.references :mode_of_study, id: :uuid

      t.timestamps null: false
    end
  end
end
