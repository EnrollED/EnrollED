class CreateRequirementElements < ActiveRecord::Migration
  def change
    create_table :requirement_elements, id: :uuid do |t|
      t.references :requirement, index: true, foreign_key: true, type: :uuid
      t.references :element, index: true, foreign_key: true, type: :uuid

      t.timestamps null: false
    end
  end
end
