class AddAttributesToUser < ActiveRecord::Migration
  def change
    remove_column :users, :maiden_name, :string
    remove_column :users, :date_of_birth, :date
    remove_column :users, :sex, :string
    remove_column :users, :phone, :string
    remove_column :users, :place_of_birth, :string
    remove_column :users, :EMSO, :string

    add_column :applications, :maiden_name, :string
    add_column :applications, :date_of_birth, :date
    add_column :applications, :sex, :string
    add_column :applications, :phone, :string
    add_column :applications, :place_of_birth, :string
    add_column :applications, :country_of_birth, :string
    add_column :applications, :EMSO, :string
    add_column :applications, :place_of_residence, :string

    add_column :applications, :country_of_residence, :string
    add_column :applications, :firstname_for_notification, :string
    add_column :applications, :lastname_for_notification, :string
    add_column :applications, :place_for_notification, :string

  end
end
