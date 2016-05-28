class AddLeaderEmailGroup < ActiveRecord::Migration
  def change
    add_column :groups, :leader_email, :string
  end
end
