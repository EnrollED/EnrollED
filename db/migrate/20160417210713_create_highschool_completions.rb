class CreateHighschoolCompletions < ActiveRecord::Migration
  def change
    create_table :highschool_completions, id: :uuid do |t|
      t.string :code, null: false
      t.string :name, null: false

      t.timestamps null: false
    end
  end
end
