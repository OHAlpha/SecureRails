class Access::GroupMembership < ActiveRecord::Base
  belongs_to :access_account, foreign_key: 'user_id'
  belongs_to :access:group, foreign_key: 'group_id'
end
