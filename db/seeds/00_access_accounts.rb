require 'openssl'

@sha = OpenSSL::Digest.new 'sha512'

def createAccount(name,pass,email)
  Access::Account.createNP name, pass, {email: email, registered_ip: "0x78000001".to_i, registered_user_agent: ''}
end

createAccount 'oalpha', 'password', 'lnugentgibson@gmail.com'
