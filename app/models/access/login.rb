class Access::Login < ActiveRecord::Base
  belongs_to :access_account, foreign_key: 'user_id'
  belongs_to :access_auto_login, foreign_key: 'auto_login_id'
end
