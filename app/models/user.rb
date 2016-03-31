	class User < ActiveRecord::Base
	has_one :twitter_user
	has_one :wallet
	has_many :story, through: :user_stories


	has_many :user_transaction

	has_many :user_stories, dependent: :destroy

	def self.from_omniauth(auth)
	  where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
	    
	    @param = auth.info.email

	    Resque.enqueue(MailSender,@param)  #signup confirmation mail to user

        

	  end
	end
	
	
	def facebook
		@facebook ||= Koala::Facebook::API.new(oauth_token)
	end

	
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

	
	def fb_likes_data(post_id)
		fpost_id = ""
		fpost_id = uid + "_"  + post_id
		begin 
			facebook.get_object(fpost_id, :fields => "likes.summary(true)")
		rescue 
			return false
		end
		
	end

	
	def fb_shares(post_id)
		fspost_id = ""
		fspost_id = uid + "_" + post_id
		begin
			facebook.get_object('/'+fspost_id+'/sharedposts?limit=10000&format=json').size
		rescue
			return false
		end
	end 

	
	def fb_comments(post_id)
		fcpost_id = ""
		fcpost_id = uid + "_" + post_id
		begin
			facebook.get_object(fcpost_id, :fields => "comments.summary(true)")["comments"]["summary"]["total_count"]
		rescue
			return false
		end
	end

end
