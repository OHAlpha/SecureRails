class Access::Group < ActiveRecord::Base
  has_many :access_group_memberships, foreign_key: 'group_id'
  has_many :access_accounts, through: :access_group_memberships
end
