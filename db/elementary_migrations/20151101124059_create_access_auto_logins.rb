class CreateAccessAutoLogins < ActiveRecord::Migration
  def change
    create_table :access_auto_logins do |t|
      t.integer :user_id
      t.string :public_key
      t.string :private_key

      t.timestamps null: false
    end
  end
end
