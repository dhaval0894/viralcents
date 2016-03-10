class SessionsController < ApplicationController
  def create
    if params[:provider] == 'facebook'
      user = User.from_omniauth(env["omniauth.auth"])
      # @flag=0
      
        session[:user_id] = user.id
  	   
  		else
        # @flag=1
        @twitter_user = TwitterUser.find_or_create_from_auth_hash(auth_hash)
  		  session[:tuser_id]=@twitter_user.id

  		
	end
  redirect_to '/dashboard'
  end

  def destroy
    
    session[:tuser_id] = nil
      session[:user_id] = nil
      redirect_to root_url
  
    
    # redirect_to '/dashboard'
  
  
  end

  protected

  def auth_hash
  	request.env['omniauth.auth']
  end
end
