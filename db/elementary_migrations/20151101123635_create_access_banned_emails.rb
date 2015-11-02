class CreateAccessBannedEmails < ActiveRecord::Migration
  def change
    create_table :access_banned_emails do |t|
      t.string :regex
      t.text :notes

      t.timestamps null: false
    end
  end
end
