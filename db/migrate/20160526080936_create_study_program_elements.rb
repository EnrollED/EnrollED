class CreateStudyProgramElements < ActiveRecord::Migration
  def change
    create_table :study_program_elements, id: :uuid do |t|
      t.references :requirement, index: true, foreign_key: true, null: false, type: :uuid
      t.references :element, index: true, foreign_key: true, null: false, type: :uuid
      t.float :weight, null: false

      t.timestamps null: false
    end
  end
end
