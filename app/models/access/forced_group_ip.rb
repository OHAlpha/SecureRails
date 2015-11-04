class Access::ForcedGroupIp < ActiveRecord::Base
  belongs_to :access_group, foreign_key: 'group_id'
end
