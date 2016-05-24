class CreateKlasiusSrvs < ActiveRecord::Migration
  def change
    create_table :klasius_srvs, id: :uuid do  |t|
      t.string :code, null: false
      t.string :description_sl, null: false
      t.string :description_en
      t.string :parent
      t.string :level
      t.boolean :is_valid, default: true

      t.timestamps null: false
    end
  end
end
