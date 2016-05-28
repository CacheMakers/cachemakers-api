class AddGroupTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.belongs_to :group
      t.timestamps null: true
    end

    create_table :age_groups do |t|
      t.string :name
      t.belongs_to :group
      t.timestamps null: true
    end

    add_column :groups, :approved, :boolean, :default => 0

  end
end
