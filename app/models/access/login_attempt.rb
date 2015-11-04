class Access::LoginAttempt < ActiveRecord::Base
  belongs_to :access_login, foreign_key: 'login_id'
end
