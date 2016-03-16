class UserPanelController < ApplicationController
	before_action :check_user, only: [:dashboard, :stories]
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
	end

	private

	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end
end
