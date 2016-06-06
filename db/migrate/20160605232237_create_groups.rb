class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :title
      t.string :description
      t.string :location
      t.string :time
      t.string :weekday
      t.string :leader_name
      t.string :leader_email
      t.boolean :age_cloverbud
      t.boolean :age_intermediate
      t.boolean :age_junior
      t.boolean :age_senior

      t.timestamps null: false
    end
  end
end
