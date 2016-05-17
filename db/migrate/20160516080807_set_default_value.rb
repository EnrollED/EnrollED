class SetDefaultValue < ActiveRecord::Migration
  def change
        change_column :countries, :is_valid, :boolean, default: true
        change_column :municipalities, :is_valid, :boolean, default: true
        change_column :highschool_completions, :is_valid, :boolean, default: true
        change_column :elements, :is_valid, :boolean, default: true
        change_column :citizens, :is_valid, :boolean, default: true
        change_column :professions, :is_valid, :boolean, default: true
        change_column :posts, :is_valid, :boolean, default: true
  end
end
