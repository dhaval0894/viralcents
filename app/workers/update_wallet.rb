class UpdateWallet
	require 'sidekiq'
	include Sidekiq::Worker
	#sidekiq_options queue: "high"
	include Sidetiq::Schedulable
    recurrence {
       #minutely(1)
       daily(1)
    }

    def perform
    	@users=User.all
    	@users.each do |current_user|
	    	@usr_wallet=Wallet.find_by(user_id: current_user.id)
			@u_story=UserStory.where(user_id: current_user.id)
			@total=0.0
		
			#calculate current earning of user
			@u_story.each do |us|
				@story=Story.find_by(id: us.story_id)
				@click_bal=(us.clicks-us.old_clicks)*@story.click_amt
				@like_bal=(us.fb_likes-us.old_likes)*@story.like_amt
				@share_bal=(us.fb_shares-us.old_shares)*@story.share_amt
				@comment_bal=(us.fb_comments-us.old_comments)*@story.comment_amt
				@fav_bal=(us.fav-us.old_fav)*@story.fav_amt
				@retweet_bal=(us.retweets-us.old_retweets)*@story.retweet_amt
				us.update(old_clicks: us.clicks,old_likes: us.fb_likes,old_shares: us.fb_shares,old_comments: us.fb_comments,old_fav: us.fav,old_retweets: us.retweets)
				@total+=@click_bal+@like_bal+@share_bal+@comment_bal+@fav_bal+@retweet_bal
			end
			
			#update wallet
			
			if @usr_wallet.nil?
				@new_wallet=Wallet.new(user_id: current_user.id,balance: @total)
				@new_wallet.save
			else
				@wallet_amt=@total+@usr_wallet.balance
				@usr_wallet.update(balance: @wallet_amt)
				
			end
			
			#update credit transaction only when @total amount is changed
			if UserTransaction.count>0
				@last_trans = UserTransaction.last
				if @last_trans.amt != @total and @last_trans.trans_type == "credit"
					@new_trans=UserTransaction.new(user_id: current_user.id,amt: @total,trans_type: 'credit',trans_date: DateTime.now)
					@new_trans.save				
				end
			else		
				if @total != 0	
					@new_trans=UserTransaction.new(user_id: current_user.id,amt: @total,trans_type: 'credit',trans_date: DateTime.now)
					@new_trans.save
				end
			end
		end
	end
end