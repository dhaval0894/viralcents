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
        @all_uid=User.pluck(:uid)
        if ref !=nil and user.referrer.nil? and user.uid != ref["ref"].join(",")[5..-6] and !@all_uid.include? user.uid
          @u = User.find(user.id)
          @u.update(referrer: ref["ref"].join(",")[5..-6])
          #update wallet amount for refferer
          # @referer=User.find_by(uid: ref["ref"].join(",")[5..-6 ])
          # @wallet=Wallet.find(user_id: @referer.id)
          # @wallet.update(balance: @wallet.balance+5.0)
          # @new_trans=UserTransaction.new(user_id: @referer.id,amt: @wallet.balance+5.0,trans_type: 'referral',trans_date: DateTime.now)
          # @new_trans.save
        end      
    else
        @twitter_user = TwitterUser.find_or_create_from_auth_hash(auth_hash)
        session[:tuser_id]=@twitter_user.id
    end
    redirect_to '/dashboard'
  end

  def destroy
    #destroy all session variables on logout
    session[:user_id] = nil
    redirect_to root_url
    # redirect_to '/dashboard'
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end
