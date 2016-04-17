class CreateElements < ActiveRecord::Migration
  def change
    create_table :elements, id: :uuid do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
