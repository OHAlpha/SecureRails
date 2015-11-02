class CreateAccessGroups < ActiveRecord::Migration
  def change
    create_table :access_groups do |t|
      t.string :name
      t.integer :permissions

      t.timestamps null: false
    end
  end
end
