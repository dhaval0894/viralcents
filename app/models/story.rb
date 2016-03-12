class Story < ActiveRecord::Base
	has_many :user, through: :user_story

	def link_thumbnail(url)
	    link_data = LinkThumbnailer.generate(url)
	    link_data.title
  	end
end
