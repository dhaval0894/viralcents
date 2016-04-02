class UserPanelController < ApplicationController

	before_action :check_user
	before_action :load_story, only: [:dashboard, :stories, :user_stories]
	#before_action :check_twitter_user ,only: [:post_to_twitter]

	def dashboard
		@us_story = UserStory.where(user_id: current_user.id)
		respond_to do |format|
      		format.html
      		format.js
  		end
	end

	def stories
		@us_story = UserStory.where(user_id: current_user.id)
	end

	def post_to_twitter
		$sid=params[:id]
		render :layout => false
  	end

  	def tweet
		@user_id=current_user.id
		#raise :test
		@tweet=twitter_user.twitter.update(params[:p])
		#raise :test
		$tid=@tweet.id
		@user_story = UserStory.find_by(user_id: current_user.id, story_id: $sid)
		
		
		if @user_story.nil?
			@user_story = UserStory.new(tw_post_id: $tid, user_id: current_user.id,story_id: $sid)
			@user_story.save	
			@check = true		
		elsif @user_story.fb_post_id.nil?
			@user_story.update(tw_post_id: @tweet.id)
			@check = true
	    end

		redirect_to dashboard_path
	end

	def bitly

		extra = {
			:utm_source => 'NOTSET',
  			:utm_medium => 'SOCIAL',
  			:utm_term => current_user.uid
  
		}
		if !params[:sid].blank?
			@story=Story.find(params[:sid])
			@story_url=[@story.orig_url,'?', extra.to_query].join("")
			# raise :test
      		client = Bitly.client
      		@url = client.shorten(@story_url)
      		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:sid])
	      		if @u_story.nil?
		      		@u_story=UserStory.new(user_id: current_user.id,story_id: params[:sid],short_url: @url.short_url)
		      		#raise :test
		      		@u_story.save
		      	end
		redirect_to :back

    	end

  	end	

  	#stories shared by user
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

	private

	#check whether user is logged in
	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end

	#generate thumbnails from the url added
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
