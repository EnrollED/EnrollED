class CreateApplicationChoices < ActiveRecord::Migration
  def change
    create_table :application_choices, id: :uuid  do |t|
      t.integer :choice, null: false

      t.references :application, type: :uuid
      t.references :study_program_mode, type: :uuid

      t.timestamps null: false
    end
  end
end
