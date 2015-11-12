require 'openssl'

@sha = OpenSSL::Digest.new 'sha512'

def createAccount(name,pass,email)
  sa = SecureRandom.hex(16)
  is = 8000 + SecureRandom.random_number( 4001 )
  hash = OpenSSL::PKCS5.pbkdf2_hmac( pass, sa, is, 64, @sha).each_byte.map { |b| b.to_s(16) }.join
  sb = SecureRandom.hex(32)
  ph = OpenSSL::HMAC.hexdigest( @sha, Access::Account.hmac_key, hash + sb )
  Access::Account.create(account_name: name, primary_email: email, salta: sa, saltb: sb, iterations: is, passhash: ph, permissions_override_add: 0, permissions_override_remove: 0, registered_ip: "0x78000001".to_i, registered_user_agent: '', must_validate: 1)
=begin
  Access::Account.create do |a|
    a.account_name = name,
    a.primary_email = email
    a.salta = sa,
    a.saltb = sb,
    a.iterations = is,
    a.passhash = ph
    a.permissions_override_add = 0,
    a.permissions_override_remove = 0,
    a.registered_ip = "0x78000001".to_i,
    a.registered_user_agent = '',
    a.must_validate = 1
  end
=end
end

createAccount 'oalpha', 'password', 'lnugentgibson@gmail.com'
