class CreateRequirements < ActiveRecord::Migration
  def change
    create_table :requirements, id: :uuid do |t|
      t.references :study_program, index: true, foreign_key: true, type: :uuid
      t.references :highschool_completion, index: true, foreign_key: true, type: :uuid
      t.references :profession, index: true, foreign_key: true, type: :uuid

      t.timestamps null: false
    end
  end
end
