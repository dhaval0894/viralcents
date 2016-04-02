class SessionsController < ApplicationController

  def create
    #Create a app session after login from facebook
    if params[:provider] == 'facebook'
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        #check whether the user is invited by a referral link
        ref = request.referrer
        #if user is invited then save referrer uid in db
        if ref.length > 25 and user.referrer.nil? and user.uid != ref[32..-6]
          @u = User.find(user.id)         
        end
  	else
        @twitter_user = TwitterUser.find_or_create_from_auth_hash(auth_hash)
  		  session[:tuser_id]=@twitter_user.id
  	end
    redirect_to '/dashboard'
  end

  def destroy
    #destroy all session variables on logout
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
