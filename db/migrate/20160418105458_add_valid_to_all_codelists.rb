class AddValidToAllCodelists < ActiveRecord::Migration
  def change
    add_column :citizens, :valid, :boolean, default: true
    add_column :countries, :valid, :boolean, default: true
    add_column :elements, :valid, :boolean, default: true
    add_column :highschool_completions, :valid, :boolean, default: true
    add_column :highschools, :valid, :boolean, default: true
    add_column :municipalities, :valid, :boolean, default: true
    add_column :posts, :valid, :boolean, default: true
    add_column :roles, :valid, :boolean, default: true
  end
end
