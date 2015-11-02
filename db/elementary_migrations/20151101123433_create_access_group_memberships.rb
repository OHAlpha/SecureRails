class CreateAccessGroupMemberships < ActiveRecord::Migration
  def change
    create_table :access_group_memberships do |t|
      t.integer :user_id
      t.integer :group_id

      t.timestamps null: false
    end
  end
end
