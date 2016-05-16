class CreateStudyProgram < ActiveRecord::Migration
  def change
    create_table :study_programs, id: :uuid do |t|
      t.string :name, null: false
      t.string :type, null: false
      t.references :higher_education_institution, type: :uuid
      t.references :type_of_study, type: :uuid

      t.timestamps null: false
    end
  end
end
