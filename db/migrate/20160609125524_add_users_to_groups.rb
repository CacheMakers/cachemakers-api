class AddUsersToGroups < ActiveRecord::Migration
  def change
      remove_column :groups, :leader_name
      remove_column :groups, :leader_email
      add_column :groups, :user_id, :integer
      add_column :groups, :approved, :boolean, default: false
      add_index :groups, :user_id
  end
end
