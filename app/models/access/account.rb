class Access::Account < ActiveRecord::Base
  has_many :access_group_memberships
  has_many :access_groups, through: :access_group_memberships
  has_many :access_auto_logins
  
  @sha = OpenSSL::Digest.new 'sha512'
  @hmac_key = 'HMAC_KEY'
  
  def self.createNP(name,pass,data)
    salta = SecureRandom.hex(16)
    iterations = 8000 + SecureRandom.random_number( 4001 )
    hash = OpenSSL::PKCS5.pbkdf2_hmac( pass, salta, iterations, 64, @sha).each_byte.map { |b| b.to_s(16) }.join
    createNSIH(name,salta,iterations,hash,data)
  end
  
  def self.createNSIH(name,salta,iterations,hash,data)
    saltb = SecureRandom.hex(32)
    passhash = OpenSSL::HMAC.hexdigest @sha, @hmac_key, hash + saltb
    create do |a|
      a.account_name = 'oalpha',
      a.primary_email = data[:email]
      a.salta = salta,
      a.saltb = saltb,
      a.iterations = iterations,
      a.passhash = passhash
      a.permissions_override_add = 0,
      a.permissions_override_remove = 0,
      a.registered_ip = data[:registered_ip],
      a.registered_user_agent = data[:registered_user_agent],
      a.must_validate = 1
    end
  end
  
end
