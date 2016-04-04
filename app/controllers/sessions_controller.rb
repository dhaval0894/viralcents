class SessionsController < ApplicationController

  def create
    #Create a app session after login from facebook
    if params[:provider] == 'facebook'
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        #check whether the user is invited by a referral link
        url = request.referrer
        uri = URI.parse(url) rescue nil
        ref = CGI.parse(uri.query) rescue nil
        if ref !=nil and user.referrer.nil? and user.uid != ref["ref"].join(","$
          @u = User.find(user.id)
          @u.update(referrer: ref["ref"].join(",")[5..-6])
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
