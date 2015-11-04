class Access::Account < ActiveRecord::Base
  has_many :access_group_memberships, foreign_key: 'user_id'
  has_many :access_groups, through: :access_group_memberships
  has_many :access_auto_logins, foreign_key: 'user_id'
  
  @sha = OpenSSL::Digest.new 'sha512'
  
  def self.hmac_key
    'HMAC_KEY'
  end
  
end
