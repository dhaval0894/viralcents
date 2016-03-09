class SessionsController < ApplicationController
  def create
  	if session[:user_id] = nil
	    user = User.from_omniauth(env["omniauth.auth"])
	    session[:user_id] = user.id
	    redirect_to root_url
	else
		@user = TwitterUser.find_or_create_from_auth_hash(auth_hash)
		session[:user_id]=@user.id
		redirect_to '/dashboard'
	end

  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end

  protected

  def auth_hash
  	request.env['omniauth.auth']
  end
end
