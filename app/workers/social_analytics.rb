class SocialAnalytics
	include Sidekiq::Worker
	#sidekiq_options queue: "high"
	include Sidetiq::Schedulable
    recurrence {
       minutely(1)
    }


    def perform()
    	require 'SmtpApiHeader.rb'
    	require 'uri'

    	hdr = SmtpApiHeader.new
    	@current_user = hdr.current_user
    	twitter_user = TwitterUser.find(1)
  		@my_story = UserStory.where(user_id: 7)
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
			if not ms.fb_post_id.nil?
				ms.update(fb_likes: @current_user.fb_likes(ms.fb_post_id), fb_shares: @current_user.fb_shares(ms.fb_post_id), fb_comments: @current_user.fb_comments(ms.fb_post_id) )
			end
			if twitter_user and not ms.tw_post_id.nil?
				#to check whether tweet exist or not
				t_user=TwitterUser.find(1)
				@status_url=URI.escape(["https://twitter.com/",t_user.twitter_name,"/status/",ms.tw_post_id].join(""))
				@response=HTTParty.get(@status_url)
				if !@response==404  #tweet exist
					@tweet_info=t_user.twitter.status(ms.tw_post_id)
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