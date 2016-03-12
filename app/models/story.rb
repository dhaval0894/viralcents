class Story < ActiveRecord::Base
	has_many :users, through: :user_stories
	has_many :user_stories

	def link_thumbnail(url)
	    link_data = LinkThumbnailer.generate(url)
	    link_data.title
  	end
end
