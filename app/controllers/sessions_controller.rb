class SessionsController < ApplicationController
  def create
  	if session[:user_id] = nil
      @flag=0
	    user = User.from_omniauth(env["omniauth.auth"])
	    session[:user_id] = user.id
	    redirect_to root_url
	else
    @flag=1
		@user = TwitterUser.find_or_create_from_auth_hash(auth_hash)
		session[:user_id]=@user.id
		redirect_to '/dashboard'
	end
  end

  def destroy
    session[:user_id] = nil
    if @flag ==0
    redirect_to root_url
  else
    redirect_to '/dashboard'
  end
  end

  protected

  def auth_hash
  	request.env['omniauth.auth']
  end
end
