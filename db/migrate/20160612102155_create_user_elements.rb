class CreateUserElements < ActiveRecord::Migration
  def change
    create_table :user_elements, id: :uuid do |t|
      t.float :score, null: false

      t.references :user, type: :uuid
      t.references :element, type: :uuid

      t.timestamps null: false
    end

    add_index :user_elements, [:element_id, :user_id], unique: true
  end
end
