require 'openssl'

@sha = OpenSSL::SHA512.new

def createAccount(name,pass)
  salt = SecureRandom.hex(32)
  hash = OpenSSL::PKCS5.pbkdf2_hmac( pass, salt, 50, 64, @sha).each_byte.map { |b| b.to_s(16) }.join
  passhash = OpenSSL::HMAC.hexdigest @sha, string[:hmac_key], hash + salt
  Access::Account.create account_name: 'oalpha', account_salt: salt, account_passhash: passhash
end

createAccount 'oalpha', 'password'
