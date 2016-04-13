class UserPanelController < ApplicationController

	before_action :check_user
	before_action :load_story, only: [:dashboard, :stories, :user_stories]
	before_action :category_check, only: [:stories, :user_stories]
	#before_action :check_twitter_user ,only: [:post_to_twitter]

	def dashboard
		@us_story = UserStory.where(user_id: current_user.id)
		#stats calculation
		@wallet = Wallet.find_by(user_id: current_user.id)
		if !@wallet.nil?
			@wallet_amt=@wallet.balance
		else
			@wallet_amt=0.0
		end
		@shared_story = UserStory.where(user_id: current_user.id).count
		#find week earning
		@last_week=UserTransaction.where(user_id: current_user.id,trans_type: "credit")
		@week_earning=0.0
		@last_week.each do |l|
			if l.trans_date > 1.week.ago
				@week_earning+=l.amt
			end
		end
		#find last_withdraw
		@last_withdraw=UserTransaction.where(user_id: current_user.id,trans_type: "debit").last
		respond_to do |format|
      		format.html
      		format.js
  		end
	end


   #coupons
		    def show_coupons
		    	@coupons=[]
		    	@my_coupons=Mapcoupon.pluck(:coupon_id)
		    	@all_coupons = Coupon.all.order("created_at DESC")
		     	#remove redeem coupons from all coupons list
		     	@all_coupons.each do |c|
		     		if !@my_coupons.include?c.id.to_s
		     			@coupons.append(c)
		     		end
		     	end
		     	
		    end
		       
		    def my_coupons
		    	if $i !=0
		    		$message="yes"
		    	end
		     	   @my_coupons = []
		     	   
		     	   @all_coupons =  Mapcoupon.all
		     	   
		     	   @all_coupons.each do |f|
		     	  		
				     	  	if f.user_id.to_i == current_user.id
				     	  		@my_coupons.push(f.coupon_id)
				     	  	else
				     	  		@my_coupons = "else"
				     	  	end
				    end
				    $i=1	
            end

		    def map_coupon
		    	$i =0
		    	@coupon=Coupon.find_by(id: params[:coupon_id])
		        @c_amt=@coupon.coupon_amount
		        @wallet=Wallet.find_by(user_id: params[:user_id])
		        #redeem coupon if enough wallet balance 
		        if @c_amt <= @wallet.balance
					@mapcoupon_new = Mapcoupon.new
	                @mapcoupon_new.user_id = params[:user_id]
	                @mapcoupon_new.coupon_id =  params[:coupon_id]
					if @mapcoupon_new.save
	                 	#deduct coupon amt from wallet amt 
	                 	@w_amt=@wallet.balance-@c_amt
		                @wallet.update(balance: @w_amt)
		                #do transaction entry
	                 	@new_trans=UserTransaction.new(user_id: params[:user_id],amt: @c_amt,trans_type: 'coupon',trans_date: DateTime.now)
						@new_trans.save
						$massage="yes"
	                 	redirect_to my_coupons_path ,notice: 'Coupon taken.' 
	                 else
	                 	redirect_to show_coupons_path ,notice: 'Something went wrong'
	                 end 
	            else
	            	#if not enough balance
	            	$message="not"
	            	redirect_to my_coupons_path ,notice: 'Not enough balance'
	            end
	        end
   
   #coupons end



	def settings

		@user_email = params[:email]  # email after form submit

		@user_contact = params[:contact]  # contact after form submit
    
      if(@user_email != nil)
      	
	       Resque.enqueue(NotificationMailSender,@user_email)  #notification confirm mail to user
	        
      elsif(@user_contact != nil)
	       
	       Resque.enqueue(NotificationMessageSender,@user_contact)  #notification confirm msg. to user
	       
       end        
        
	end

	#all stories page
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
		@story=Story.find_by(id: $sid)
		@tweet=twitter_user.twitter.update_with_media(@story.title+" : "+params[:p],open(@story.image_url))
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
			#add all stories to the list
			@a_stories << Story.where(id: ms.story_id)
			@a_stories[i]<< ms.short_url
			i+=1
			if !ms.fb_post_id.nil?
				ms.update(fb_likes: current_user.fb_likes(ms.fb_post_id), fb_shares: current_user.fb_shares(ms.fb_post_id), fb_comments: current_user.fb_comments(ms.fb_post_id) )
			end
			if !ms.tw_post_id.nil? and twitter_user
				#to check whether tweet exist or not
				@status_url=["https://twitter.com/",twitter_user.twitter_name,"/status/",ms.tw_post_id].join("")
				@response=HTTParty.get(@status_url)
				if !@response==404  #tweet exist
					@tweet_info=twitter_user.twitter.status(ms.tw_post_id)
					ms.update(fav: @tweet_info.favorite_count,retweets: @tweet_info.retweet_count)
				end
				#byebug
				
			end
			if !ms.short_url.nil?
				@url=bitly_hash(ms.story_id)
				ms.update(clicks: @url.stats["clicks"])

			end
		end
	end

	#generate referral url for inviting
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

	#check whether a post is already shared to facebook
	def check_fb_share
		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:id])
	end

	#find wallet balance
	def wallet
		@u_story=UserStory.where(user_id: current_user.id)

		#stats calculation
		@usr_wallet=Wallet.find_by(user_id: current_user.id)
		@shared_story = UserStory.where(user_id: current_user.id).count
		#find week earning
		@last_week=UserTransaction.where(user_id: current_user.id,trans_type: "credit")
		@week_earning=0.0
		@last_week.each do |l|
			if l.trans_date > 1.week.ago
				@week_earning+=l.amt
			end
		end

		#find last_withdraw
		@last_withdraw=UserTransaction.where(user_id: current_user.id,trans_type: "debit").last
		
		#last 10 user transaction
		@last=UserTransaction.where(user_id: current_user.id).limit(10)

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
		
		#update credit transaction
		@new_trans=UserTransaction.new(user_id: current_user.id,amt: @total,trans_type: 'credit',trans_date: DateTime.now)
		@new_trans.save
	end


	#user details for recharge
	def recharges

		@recharge=Recharge.new()
		@recharge_stat=RechargeStat.new()
	end

	#process recharge request and update transaction deatils
	def addrecharge
		@flag=0
		@wallet=Wallet.find_by(user_id: current_user.id)
      	if !@wallet.nil?  
      		if @wallet.balance>= (params[:recharge_stat][:amount]).to_f
	      		@flag=1
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

		      	#update debit transaction and wallet
		      	if @rec_stat_data["status"]=="success"
		      		@new_trans=UserTransaction.new(user_id: current_user.id,amt: @pay_status.amount,trans_type: 'debit',trans_date: DateTime.now)
					@new_trans.save
					
					@balance=@wallet.balance-@pay_status.amount
					@wallet.update(balance: @balance)
				end
			else
				@message="Not enough balance"
			end
		else
			@message="Wallet not exist"
		end
      	
    end

	
	protected # protected methods dont add any public methods below

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




	private  # private methods dont add any public code below
    
    #categories drop down for story page
    def category_check
    	@categories = Category.all
		if !params[:category].nil? and params[:category] != ""
			@category = Category.find(params[:category])
			@selected = @category["name"]
			if @selected != "All"
				@stories = Story.where(category_id: params[:category])
			else
				@stories = Story.all
			end
		end
    end

	#check whether user is logged in
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

	#generate thumbnails from the url added
	def load_story
		#select only active stories
		@stories = Story.where(story_status: "active")
		@stories.each do |story|	
			if story.image_url.nil? and story.title.nil?
				link_data = story.link_thumbnail(story.orig_url)
				if link_data
					story.update(title: link_data.title, image_url: link_data.images.first.src.to_s)
				end
			end
		end
	
	end   # private block ends here

	
end
