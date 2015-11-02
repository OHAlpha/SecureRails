class CreateAccessLoginAttempts < ActiveRecord::Migration
  def change
    create_table :access_login_attempts do |t|
      t.string :username
      t.text :passhash
      t.integer :login_id

      t.timestamps null: false
    end
  end
end
