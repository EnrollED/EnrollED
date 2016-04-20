class CreatePosts < ActiveRecord::Migration
    def change
      create_table :posts, id: :uuid do |t|
        t.string :code, null: false
        t.string :name, null: false

        t.timestamps null: false
      end
    end
end
