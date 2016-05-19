class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments, id: :uuid do |t|
      t.string :name, null: false
      t.datetime :start, null: false
      t.datetime :end, null: false

      t.timestamps null: false
    end
  end
end
