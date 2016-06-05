class AddGroupFields < ActiveRecord::Migration
  def change
    add_column :groups, :weekday, :string
  end
end
