class CreateUserHighSchoolCompletion < ActiveRecord::Migration
  def change
    create_table :user_high_school_completions do |t|
      t.boolean :passed, null: false

      t.references :user, type: :uuid
      t.references :highschool_completion, type: :uuid

      t.timestamps null: false
    end

    add_index :user_high_school_completions, [:highschool_completion_id, :user_id], unique: true,
              name: 'index_user_high_school_completions'
  end
end
