class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications, id: :uuid do |t|
      t.string :status, null: false
      t.string :application_number, null: false
      t.datetime :submission_date, null: false

      t.references :user, type: :uuid
      t.references :enrollment, type: :uuid
      t.references :highschool, type: :uuid
      t.references :post_of_residence, type: :uuid
      t.references :post_for_notification, type: :uuid
      t.references :citizen, type: :uuid
      t.references :municipality, type: :uuid
      t.references :country_of_birth, type: :uuid
      t.references :country_of_residence, type: :uuid
      t.references :highschool_country, type: :uuid
      t.references :highschool_completion, type: :uuid
      t.references :klasius_srv, type: :uuid

      t.timestamps null: false
    end
  end
end
