class UserPanelController < ApplicationController
	before_action :check_user
	def dashboard
		respond_to do |format|
      		format.html
      		format.js
  		end
	end

	def stories
		@stories = Story.all
		@stories.each do |story|
			link_data = story.link_thumbnail(story.orig_url)
			if link_data
				story.update(title: link_data.title, image_url: link_data.images.first.src.to_s)
			end
		end
		@us_story = UserStory.where(user_id: current_user.id)
	end

	def user_stories
	end

	#adds fbshare_post id to UserStory
	def add_fbStory_id
		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:id])
		if @u_story.nil?
			@u_story = UserStory.new(fb_post_id: params[:post_id], user_id: current_user.id, story_id: params[:id])
			@u_story.save	
			@check = true		
		elsif @u_story.fb_post_id.nil?
			@u_story.update(fb_post_id: params[:post_id], user_id: current_user.id, story_id: params[:id])
			@check = true
	    end
	    respond_to do |format|
	      format.json
	    end
	end

	def check_fb_share
		@u_story = UserStory.find_by(user_id: current_user.id, story_id: params[:id])
	end
	private

	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end
end
