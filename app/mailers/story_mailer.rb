class StoryMailer < ApplicationMailer

include SendGrid

  default :from => 'viralcents.com'

 def send_story_email(users)

 	@users = users
        

    mail( :to => 'dhaval.shin@gmail.com',
    :subject => 'Viralcents Latest Stories' )
  end

end
