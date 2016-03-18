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
			link_data = story.link_thumbnail(story.original_url)
			if link_data
				story.update(title: link_data.title, image_url: link_data.images.first.src.to_s)
			end
		end
	end

	def post_to_twitter
		# raise :test
  #   	@tid=params[:latest_status_id]
    #@tweet_info=($client.status(@tid))
    
    # @fav=@tweet_info.favourites
  end

  def tweet()
		@tweet=twitter_user.twitter.update(params[:p])
		#raise :test
		$tid=@tweet.id
		
	end
	private

	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end

	
end
