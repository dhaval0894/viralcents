class Story < ActiveRecord::Base
	has_many :users, through: :user_stories
	has_many :user_stories, dependent: :destroy
	belongs_to :admin_user

	#generate thumbnails from url for each story
	def link_thumbnail(url)
		#to handle execution expired error
		http = Net::HTTP.new("localhost", 3000)
		http.read_timeout = 15000
		begin
	    	link_data = LinkThumbnailer.generate(url)
	    	link_data
		rescue Timeout::Error
		end
  	end
end
