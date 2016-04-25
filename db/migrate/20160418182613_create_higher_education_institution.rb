class CreateHigherEducationInstitution < ActiveRecord::Migration
  def change
    create_table :higher_education_institutions, id: :uuid do |t|
      t.string :code, null: false
      t.string :name, null: false
      t.string :acronym, null: false
      t.references :university, type: :uuid
      t.references :municipality, type: :uuid

      t.timestamps null: false
    end
  end
end
