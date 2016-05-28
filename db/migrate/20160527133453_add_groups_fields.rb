class AddGroupsFields < ActiveRecord::Migration
  def change
    add_column :groups, :leader_name, :string
  end
end
