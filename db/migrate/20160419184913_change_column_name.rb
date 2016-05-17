class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :posts, :valid, :is_valid
    rename_column :countries, :valid, :is_valid
    rename_column :municipalities, :valid, :is_valid
    rename_column :highschool_completions, :valid, :is_valid
    rename_column :highschools, :valid, :is_valid
    rename_column :elements, :valid, :is_valid
    rename_column :citizens, :valid, :is_valid
    rename_column :professions, :valid, :is_valid
  end
end
