class SocialAnalytics 
	require 'twitter'
	require 'sidekiq'
	include Sidekiq::Worker
	#sidekiq_options queue: "high"
	include Sidetiq::Schedulable
    recurrence {

       minutely(20)
    }

    def perform
    	#to encode url
    	require 'uri'
    	@users = User.all
    	#update analytics for all users
    	@users.each do |user|
	     	twitter_user = TwitterUser.find_by(user_id: user.id)
	   		@my_story = UserStory.where(user_id: user.id)
		 	@my_story.each do |ms|
		 		#add all stories to the list
			 		
			 	#facebook analytics	
				if not ms.fb_post_id.nil?
					ms.update(fb_likes: user.fb_likes(ms.fb_post_id), fb_shares: user.fb_shares(ms.fb_post_id), fb_comments: user.fb_comments(ms.fb_post_id) )
				end
				#twitter analytics
		 		if twitter_user and not ms.tw_post_id.nil?
		 			#to check whether tweet exist or not
		 			
		 			t_user=twitter_user
					@status_url=URI.escape(["https://twitter.com/",t_user.twitter_name,"/status/",ms.tw_post_id].join(""))

		 			@response=HTTParty.get(@status_url)
		 			
		 			if not @response==404  #tweet exist
		 				@tweet_info=t_user.twitter.status(ms.tw_post_id)
		 				ms.update(fav: @tweet_info.favorite_count,retweets: @tweet_info.retweet_count)
		 			end
				end
				#clicks analytics
				if not ms.short_url.nil?
					extra = {
						:utm_source => 'NOTSET',
			  			:utm_medium => 'SOCIAL',
			  			:utm_term => user.uid
			  
					}
					@story=Story.find(ms.story_id)
					@story_url=[@story.orig_url,'?', extra.to_query].join("")
					client = Bitly.client
			      	@url=client.shorten(@story_url)
					ms.update(clicks: @url.stats["clicks"])
					
				end
		 	end
		end
	 end
end