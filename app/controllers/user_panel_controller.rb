class UserPanelController < ApplicationController

	before_action :check_user
	before_action :load_story, only: [:dashboard, :stories, :user_stories]
	#before_action :check_twitter_user ,only: [:post_to_twitter]

	def dashboard
		@us_story = UserStory.where(user_id: current_user.id)
		@wallet_amt = Wallet.find_by(user_id: current_user.id)
		@shared_story = UserStory.where(user_id: current_user.id).count
		respond_to do |format|
      		format.html
      		format.js
  		end

	end

	def stories
		@us_story = UserStory.where(user_id: current_user.id)
	end

	#twitter widget for displaying tweet
	def post_to_twitter
		$sid=params[:id]
		render :layout => false
  	end

  	#post tweet to twitter
  	def tweet
		@user_id=current_user.id
		@tweet=twitter_user.twitter.update(params[:p])
		$tid=@tweet.id
		@user_story = UserStory.find_by(user_id: current_user.id, story_id: $sid)
		@user_story.update(tw_post_id: @tweet.id)
		
		redirect_to dashboard_path
	end

	#update short url in user_story
	def bitly
		if !params[:sid].blank?
			#connect with bitly
			@url=bitly_hash(params[:sid])
      		
      		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:sid])
	      		if @u_story.nil?
		      		@u_story=UserStory.new(user_id: current_user.id,story_id: params[:sid],short_url: @url.short_url)
		      		#raise :test
		      		@u_story.save
		      	end
		redirect_to :back

    	end

  	end	

  	#stories shared by user and stories analytics
	def user_stories
		@my_story = UserStory.where(user_id: current_user.id)
		@a_stories = []

		i=0
		@my_story.each do |ms|
			@a_stories << Story.where(id: ms.story_id)
			@a_stories[i]<< ms.short_url
			i+=1
			if !ms.fb_post_id.nil?
				ms.update(fb_likes: current_user.fb_likes(ms.fb_post_id), fb_shares: current_user.fb_shares(ms.fb_post_id), fb_comments: current_user.fb_comments(ms.fb_post_id) )
			end
			if !ms.tw_post_id.nil?
				@tweet_info=twitter_user.twitter.status(ms.tw_post_id)
				ms.update(fav: @tweet_info.favorite_count,retweets: @tweet_info.retweet_count)
			end
			if !ms.short_url.nil?
				@url=bitly_hash(ms.story_id)
				ms.update(clicks: @url.stats["clicks"])

			end
		end
	end

	def referrals
		@all_users = User.all
	end

	#adds referral link to user
	def add_referral_link
		if current_user.referral_link.nil?
			current_user.update(referral_link: params[:r_link])
		end
	end

	#adds fbshare_post id to UserStory
	def add_fbStory_id
		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:id])
		if @u_story.fb_post_id.nil?
			@u_story.update(fb_post_id: params[:post_id], user_id: current_user.id, story_id: params[:id])
	    end
	    respond_to do |format|
	      format.json
	    end
	end

	def check_fb_share
		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:id])
	end

	#find wallet balance
	def wallet
		@u_story=UserStory.where(user_id: current_user.id)
		@usr_wallet=Wallet.find_by(user_id: current_user.id)
		if @usr_wallet.nil?
			@total=0.0
		else
			@total=@usr_wallet.balance
		end
	

		@u_story.each do |us|
			@story=Story.find_by(id: us.story_id)
			@click_amt=us.clicks*@story.click_amt
			@like_amt=us.fb_likes*@story.like_amt
			@share_amt=us.fb_shares*@story.share_amt
			@comment_amt=us.fb_comments*@story.comment_amt
			@fav_amt=us.fav*@story.fav_amt
			@retweet_amt=us.retweets*@story.retweet_amt
			@conv_amt=us.conversation*@story.conversation_amt
			@total+=@click_amt+@like_amt+@share_amt+@comment_amt+@fav_amt+@retweet_amt+@conv_amt
		end
		
		
		if @usr_wallet.nil?
			@new_wallet=Wallet.new(user_id: current_user.id,balance: @total)
			@new_wallet.save
			@current=@total

		else
			@usr_wallet.update(balance: @total)
			@current=@total-@usr_wallet.balance
		end
		
		
		@new_trans=UserTransaction.new(user_id: current_user.id,amt: @current,trans_type: 'cr',trans_date: DateTime.now)
		@new_trans.save
	end

	#user details for recharge
	def recharges

		@recharge=Recharge.new()
		@recharge_stat=RechargeStat.new()
	end

	#process recharge request and update transaction deatils
	def addrecharge
		@recharge_key=Rails.application.secrets.recharge_api_token
    	@url=["https://www.pay2all.in/web-api/get-number?api_token=",@recharge_key,"&number=",params[:recharge][:mobile]].join("")
    	@recharge_details=HTTParty.get(@url)
    	@provider_id=JSON.parse(@recharge_details.body)["provider_id"]
      	@recharge_url=["https://www.pay2all.in/web-api/paynow?api_token=",@recharge_key,"&number=",params[:recharge][:mobile],"&provider_id=",@provider_id,"&amount=",params[:recharge_stat][:amount],"&client_id=",current_user.uid].join("")
      	#@recharge_status=HTTParty.get(@recharge_url)
      	#@rec_stat_data=JSON.parse(@recharge_status.body)

      	#update db related to recharge
		@recharge_user=Recharge.find_by(user_id: current_user.id)
		if @recharge_user.nil? or @recharge_user.mobile!=params[:recharge][:mobile]
			@recharge = Recharge.new(user_id: current_user.id,mobile: params[:recharge][:mobile])
			@recharge.save
			@pay_status = RechargeStat.new(recharge_id: @recharge.id,pay_id:@rec_stat_data["payid"] ,amount: params[:recharge_stat][:amount])
			@pay_status.save
		else
			@pay_status = RechargeStat.new(recharge_id: @recharge_user.id, pay_id: @rec_stat_data["payid"],amount: params[:recharge_stat][:amount])
      		@pay_status.save
      	end

      	if @rec_stat_data["status"]=="success"
      		@new_trans=UserTransaction.new(user_id: current_user.id,amt: @pay_status.amount,trans_type: 'debit',trans_date: DateTime.now)
			@new_trans.save
			@wallet=Wallet.find_by(user_id: current_user.id)
			@balance=@wallet.balance-@pay_status.amount
			@wallet.update(balance: @balance)
		end
      	
      # 	byebug
      # render :nothing => true
    end

	protected

	#bitly connection and get its response
	def bitly_hash(story_id)
		extra = {
			:utm_source => 'NOTSET',
  			:utm_medium => 'SOCIAL',
  			:utm_term => current_user.uid
  
		}
		@story=Story.find(story_id)
		@story_url=[@story.orig_url,'?', extra.to_query].join("")
		client = Bitly.client
      	client.shorten(@story_url)
      end

	private

	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end

	# def check_twitter_user
	# 	if twitter_user.nil?
	# 		redirect_to "/auth/twitter"
	# 	end
	# end


	def load_story
		@stories = Story.all
		@stories.each do |story|	
			if story.image_url.nil? and story.title.nil?
				link_data = story.link_thumbnail(story.orig_url)
				if link_data
					story.update(title: link_data.title, image_url: link_data.images.first.src.to_s)
				end
			end
		end
	end

	
end
