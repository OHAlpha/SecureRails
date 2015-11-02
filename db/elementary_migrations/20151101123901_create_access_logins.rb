class CreateAccessLogins < ActiveRecord::Migration
  def change
    create_table :access_logins do |t|
      t.integer :user_id
      t.integer :ip
      t.text :user_agent
      t.integer :auto_login_id

      t.timestamps null: false
    end
  end
end
