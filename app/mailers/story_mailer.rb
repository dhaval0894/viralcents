class StoryMailer < ApplicationMailer

	include SendGrid
	default :from => 'viralcents.com'
	def send_story_email(user,email)
		@user=user
		mail( 
        	:to => email,
    		:subject => 'Viralcents Latest Stories' )
    end
end
