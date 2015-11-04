require 'openssl'

class AccessController < ApplicationController
  
  def register
  end

  def after_register
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
end
