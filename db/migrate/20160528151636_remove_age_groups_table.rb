class RemoveAgeGroupsTable < ActiveRecord::Migration
  def change
    drop_table :age_groups
    add_column :groups, :age_cloverbud, :boolean, :default => 0
    add_column :groups, :age_intermediate, :boolean, :default => 0
    add_column :groups, :age_junior, :boolean, :default => 0
    add_column :groups, :age_senior, :boolean, :default => 0
  end
end
