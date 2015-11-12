require 'openssl'

class AccessController < ApplicationController
  
  def register
    @uname = ''
    @email = ''
    @salt = SecureRandom.hex(16)
    @iterations = 8000 + SecureRandom.random_number( 4001 )
  end

  def after_register
    sa = params[:salt]
    is = params[:iterations]
    name = params[:username]
    hash = params[:passhash]
    sb = SecureRandom.hex(32)
    ph = OpenSSL::HMAC.hexdigest( @sha, Access::Account.hmac_key, hash + sb )
    @user = Access::Account.new(account_name: name, primary_email: email, salta: sa, saltb: sb, iterations: is, passhash: ph, permissions_override_add: 0, permissions_override_remove: 0, registered_ip: ip_to_i(request.env['REMOTE_ADDR']), registered_user_agent: request.env['HTTP_USER_AGENT'], must_validate: 1)

    respond_to do |format|
      if @user.save
        format.html { render notice: 'File path was successfully created.' }
        format.json { render status: :created, location: @user }
      else
        format.html { render :register }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def login
  end

  def post_login
    text = params[:public]
    if text.index('@')
      redirect_to '/access/check_email?email=' + params[:public]
    else
      redirect_to '/access/check_username?username=' + params[:public]
    end
  end

  def after_login
  end

  def logout
  end

  def after_logout
  end

  def cancel
  end

  def after_cancel
  end

  def check_username
    @user = Access::Account.where(account_name: params[:username]).first
    @exists = ! @user.nil?
  end

  def check_email
    @exists = ! Access::Account.where(primary_email: params[:email]).nil?
  end

  def check_passhash
    @user = Access::Account.find(params[:id])
    calculated_passhash = OpenSSL::HMAC.hexdigest( OpenSSL::Digest.new('sha512'), Access::Account.hmac_key, params[:secret] + @user.saltb )
    @success = @user.passhash == calculated_passhash
  end
  
  protected
    def self.ip_to_i(s)
      is = s.split('.')
      is[0].to_i * 256*256*256 + is[1].to_i * 256*256 + is[2].to_i * 256 + is[3].to_i
    end
end
