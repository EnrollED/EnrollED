class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries, id: :uuid do |t|
      t.integer :code, null: false
      t.string :name, null: false
      t.boolean :eu_member, null: false

      t.timestamps null: false
    end
  end
end