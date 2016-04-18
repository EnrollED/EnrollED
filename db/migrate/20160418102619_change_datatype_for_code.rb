class ChangeDatatypeForCode < ActiveRecord::Migration
  def change
    change_column :countries, :code,  :string
    change_column :municipalities, :code,  :string
  end
end
