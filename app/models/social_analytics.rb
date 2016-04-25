class SocialAnalytics
	include Sidekiq::Worker
	#sidekiq_options queue: "high"
	include Sidetiq::Schedulable
    recurrence {
       minutely(2)
    }


    def perform()
    	usr=User.find(3)
  		@my_story = UserStory.where(user_id: 3)
		@a_stories = []
		i=0
		@my_story.each do |ms|
			#add all stories to the list
			puts ms
			@a_stories << Story.where(id: ms.story_id)
			@a_stories[i]<< ms.short_url
			@a_stories[i]<<ms.fb_post_id
			@a_stories[i]<<ms.tw_post_id
			i+=1
			if !ms.fb_post_id.nil?
				ms.update(fb_likes: usr.fb_likes(ms.fb_post_id), fb_shares: usr.fb_shares(ms.fb_post_id), fb_comments: usr.fb_comments(ms.fb_post_id) )
			end
			t_user=TwitterUser.find(5)
			if !ms.tw_post_id.nil? and t_user
				#to check whether tweet exist or not
				
				@status_url=["https://twitter.com/",t_user.twitter_name,"/status/",ms.tw_post_id].join("")
				@response=HTTParty.get(@status_url)
				if !@response==404  #tweet exist
					@tweet_info=t_user.twitter.status(ms.tw_post_id)
					puts @tweet_info
					ms.update(fav: @tweet_info.favorite_count,retweets: @tweet_info.retweet_count)
				end
				#byebug
				
			end
			# if !ms.short_url.nil?
			# 	@url=bitly_hash(ms.story_id)
			# 	ms.update(clicks: @url.stats["clicks"])

			# end
		end
	end
end