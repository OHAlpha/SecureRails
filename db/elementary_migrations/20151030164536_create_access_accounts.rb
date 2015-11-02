class CreateAccessAccounts < ActiveRecord::Migration
  def change
    create_table :access_accounts do |t|
      t.string :account_name
      t.string :primary_email
      t.string :salta
      t.string :saltb
      t.integer :iterations
      t.string :passhash
      t.integer :permissions_override_add
      t.integer :permissions_override_remove
      t.integer :registered_ip
      t.text :registered_user_agent
      t.integer :must_validate

      t.timestamps null: false
    end
  end
end
