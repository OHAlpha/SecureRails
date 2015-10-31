require 'digest'
require 'openssl'

class NavController < ApplicationController
  def home
    sha512 = OpenSSL::Digest.new 'sha512'
    @text=[{string: 'htw45wreshbydh54hse', hmac_key: 'njea', pbkdf2_salt: 'nursfh'}]
    #@text=[{string: 'abc', hmac_key: '123', pbkdf2_salt: '456'},{string: 'sdbderg3erbs', hmac_key: 'lfeka', pbkdf2_salt: 'ksjgh'},{string: 'hte5w4yhw4sethah', hmac_key: 'dvja', pbkdf2_salt: 'nbrsj'},{string: 'htw45wreshbydh54hse', hmac_key: 'njea', pbkdf2_salt: 'nursfh'}]
    @text.each do |string|
      string[:md5] = Digest::MD5.hexdigest string[:string]
      string[:sha256] = Digest::SHA256.hexdigest string[:string]
      string[:sha384] = Digest::SHA384.hexdigest string[:string]
      string[:sha512] = Digest::SHA512.hexdigest string[:string]
      string[:hmac] = OpenSSL::HMAC.hexdigest sha512, string[:hmac_key], string[:string]
      string[:pbkdf2] = OpenSSL::PKCS5.pbkdf2_hmac( string[:string], string[:pbkdf2_salt], 10000, 64, sha512).each_byte.map { |b| b.to_s(16) }.join
    end
  end

  def index
  end

  def map
  end
end
