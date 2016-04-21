class AddAdditionalAttributesToUser < ActiveRecord::Migration
  def change
    add_column :users, :maiden_name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :sex, :string
    add_column :users, :phone, :string
    add_column :users, :place_of_birth, :string
    add_column :users, :EMSO, :string
  end
end
