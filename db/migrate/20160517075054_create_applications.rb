class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications, id: :uuid do |t|
      t.string :status, null: false
      t.datetime :submission_date, null: false

      t.references :user, type: :uuid
      t.references :enrollment, type: :uuid
      t.references :highschool, type: :uuid
      t.references :post_of_residence, type: :uuid
      t.references :post_for_notification, type: :uuid
      t.references :citizen, type: :uuid


      t.timestamps null: false
    end
  end
end
