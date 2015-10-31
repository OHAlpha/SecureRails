require 'openssl'

@sha = OpenSSL::Digest.new 'sha512'

def createAccount(name,pass)
  salta = SecureRandom.hex(16)
  iterations = 8000 + SecureRandom.random_number( 4001 )
  hash = OpenSSL::PKCS5.pbkdf2_hmac( pass, salta, iterations, 64, @sha).each_byte.map { |b| b.to_s(16) }.join
  saltb = SecureRandom.hex(32)
  passhash = OpenSSL::HMAC.hexdigest @sha, 'HMAC_KEY', hash + saltb
  Access::Account.create account_name: 'oalpha', account_salta: salta, account_saltb: saltb, account_iterations: iterations, account_passhash: passhash
end

createAccount 'oalpha', 'password'
