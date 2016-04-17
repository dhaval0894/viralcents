class User < ActiveRecord::Base
	has_one :twitter_user
	has_one :wallet, dependent: :destroy
	has_many :mapcoupon
	has_many :story, through: :user_stories
	has_many :user_transaction
	has_many :recharge
	has_many :user_stories, dependent: :destroy

	#save data to user when sign-up

	def self.from_omniauth(auth)
		
	  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.email = auth.info.email	
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    #check if user doesn't exist already and send mail
	    if not User.exists?(:uid => user.uid)
	    	@param = auth.info.email
	    	# send invitation mails to user
        	MailSender.perform_async(@param)
        end
	    user.save!

	  end
	end

	#facebook Graph API to get analytics for post

	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end


	#get facebook unique likes

	def fb_likes(post_id)
		# facebook.get_object('966978620053068_971364312947832', :fields => "likes.summary(true)")["likes"]["summary"]["total_count"]
		#full post id for user
		fpost_id = ""
		fpost_id = uid + "_"  + post_id
		begin 
			facebook.get_object(fpost_id, :fields => "likes.summary(true)")["likes"]["summary"]["total_count"]
		rescue 
			return false
		end	
	end


	#get facebook unique likes data

	def fb_likes_data(post_id)
		fpost_id = ""
		fpost_id = uid + "_"  + post_id
		begin 
			facebook.get_object(fpost_id, :fields => "likes.summary(true)")
		rescue 
			return false
		end
		
	end


	#get facebook unique shares

	def fb_shares(post_id)
		fspost_id = ""
		fspost_id = uid + "_" + post_id
		begin
			@count = []
			@shares = facebook.get_object('/'+fspost_id+'/sharedposts?limit=10000&format=json')
			@shares.each do |sh|
				@count << sh["id"][0..14]
			end
			@count.uniq.length
		rescue
			return false
		end
	end 


	#get facebook unique comments

	def fb_comments(post_id)
		fcpost_id = ""
		fcpost_id = uid + "_" + post_id
		begin
			@count = []
			@comments = facebook.get_object(fcpost_id, :fields => "comments.summary(true)")["comments"]["data"]
			@comments.each do |cm|
				@count << cm["from"]["id"]
			end
			@count.uniq.length
		rescue
			return false
		end
	end

end
