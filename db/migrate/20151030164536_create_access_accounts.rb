class CreateAccessAccounts < ActiveRecord::Migration
  def change
    create_table :access_accounts do |t|
      t.string :account_name
      t.string :account_salt
      t.string :account_passhash

      t.timestamps null: false
    end
  end
end
