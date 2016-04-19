class AddValidToAll < ActiveRecord::Migration
  def change
    add_column :countries, :valid, :boolean
    add_column :municipalities, :valid, :boolean
    add_column :highschool_completions, :valid, :boolean
    add_column :highschools, :valid, :boolean
    add_column :elements, :valid, :boolean
    add_column :citizens, :valid, :boolean
    add_column :professions, :valid, :boolean
    add_column :posts, :valid, :boolean

  end
end
