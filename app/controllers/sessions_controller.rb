class SessionsController < ApplicationController

  def create
    #Create a app session after login from facebook
    if params[:provider] == 'facebook'
        @all_uid=User.pluck(:uid)
        user = User.from_omniauth(env["omniauth.auth"])
        session[:user_id] = user.id
        #check whether the user is invited by a referral link
        url = request.referrer
        uri = URI.parse(url) rescue nil
        ref = CGI.parse(uri.query) rescue nil

        #if new user uses a refferel link 
        if ref !=nil and user.referrer.nil? and user.uid != ref["ref"].join(",")[5..-6] and !@all_uid.include? user.uid.to_s
          @u = User.find(user.id)
          @u.update(referrer: ref["ref"].join(",")[5..-6])
          #update wallet amount for refferer
          @ref1=User.find_by(uid: ref["ref"].join(",")[5..-6 ])
          @wallet=Wallet.where(user_id: @ref1.id)
          update_wallet(@wallet,@ref1.id,5.0)
          #upadate wallet for second level referrer
          if @ref1.referrer
            @ref2=User.find_by(uid: @ref1.referrer)
            @wallet1=Wallet.where(user_id: @ref2.id)
            update_wallet(@wallet1,@ref2.id,2.0)
          end
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

 #update wallet and transaction for referrel
  def update_wallet(wallet,usr_id,amt)
    if wallet ==[]
      @w=Wallet.new(user_id: usr_id,balance: amt)
      @w.save
    else
      @total_amt=wallet[0]["balance"]+amt
      wallet[0].update(balance: @total_amt)
    end
    @new_trans=UserTransaction.new(user_id: usr_id,amt: amt,trans_type: 'referral',trans_date: DateTime.now)
    @new_trans.save
  end
end
