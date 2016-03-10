class Story < ActiveRecord::Base
	has_many :user, through: :user_story
end
