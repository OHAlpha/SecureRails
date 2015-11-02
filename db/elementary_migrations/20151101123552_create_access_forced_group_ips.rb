class CreateAccessForcedGroupIps < ActiveRecord::Migration
  def change
    create_table :access_forced_group_ips do |t|
      t.integer :group_id
      t.integer :ip_low
      t.integer :ip_high
      t.text :notes

      t.timestamps null: false
    end
  end
end
