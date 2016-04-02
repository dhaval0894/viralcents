class TwitterUser < ActiveRecord::Base 
	belongs_to :user
	#set twitter auth hash values to database
	def self.find_or_create_from_auth_hash(auth_hash)
		@twitter_user  = where(provider: auth_hash.provider, twitter_uid: auth_hash.uid).first_or_create
		@twitter_user.update(
			twitter_name: auth_hash.info.name,
			#profile_image: auth_hash.info.image,
			twitter_oauth_token: auth_hash.credentials.token,
			twitter_oauth_secret: auth_hash.credentials.secret)
		@twitter_user
	end

	#set twitter client to access client's timeline
	def twitter
    $twitter_client = Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.secrets.twitter_api_key
      config.consumer_secret     = Rails.application.secrets.twitter_api_secret
      config.access_token        = twitter_oauth_token
      config.access_token_secret = twitter_oauth_secret
    end
    
end
end
