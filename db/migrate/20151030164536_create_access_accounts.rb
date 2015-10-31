class CreateAccessAccounts < ActiveRecord::Migration
  def change
    create_table :access_accounts do |t|
      t.string :account_name
      t.string :account_salta
      t.string :account_saltb
      t.integer :account_iterations
      t.string :account_passhash

      t.timestamps null: false
    end
  end
end
