class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|

      ## User fields
      t.string :username, null: false
      t.string :firstname, null: false
      t.string :lastname, null: false

      # Disabled
      t.datetime :disabled_at

      t.timestamps null: false
    end

    add_index :users, :username, unique: true
  end
end
