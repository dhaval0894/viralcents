class WalletMail

  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence backfill: true do
      weekly(1)
  end

  def perform()
    @list_of_users = User.all
    #create list of all users      
      @list_of_users.each do |each_user|
        @usr_wallet = Wallet.find_by(user_id: each_user.id)
          if @usr_wallet != nil and each_user.email != nil
              @credit_type=["referral","credit"]
              @last_week=UserTransaction.where(user_id: each_user.id,trans_type: @credit_type)
              @week_earning=0.0
              @last_week.each do |l|
                if l.trans_date > 1.week.ago
                  @week_earning+=l.amt
                end
              end
              ViralcentsMailer.send_wallet_email(each_user.name,@usr_wallet.balance,@week_earning,each_user.email).deliver
          end
      end
  end
end