class Access::AutoLogin < ActiveRecord::Base
  belongs_to :access_account, foreign_key: 'user_id'
end
