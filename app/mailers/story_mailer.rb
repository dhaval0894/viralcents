class StoryMailer < ApplicationMailer
	include SendGrid
	default :from => 'viralcents.com'
	def send_story_email(users)
		@users = users
        mail( :to => 'a.thakur73.at@gmail.com',
        	#:to => @users.email,
    		:subject => 'Viralcents Latest Stories' )
    end
end
