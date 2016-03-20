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
		
	end

	def post_to_twitter
		render :layout => false
		
  end

  def tweet
		
		@tweet=twitter_user.twitter.update(params[:p])
		#raise :test
		$tid=@tweet.id
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
    end
  end
	private

	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end

	
end
