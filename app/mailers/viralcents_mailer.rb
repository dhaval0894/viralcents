class ViralcentsMailer < ApplicationMailer
	include SendGrid
	default :from => 'viralcents.com'
	#story email
	def send_story_email(user,email)
		@name=user
		mail( 
        	:to => email,
    		:subject => 'Viralcents Latest Stories' )
    end
    # wallet info email
    def send_wallet_email(name,balance,week_earning,email)
		@name=name
		@user_bal=balance
		@week_earning = week_earning
		mail( 
        	:to => email,
    		:subject => 'Viralcents: Weekly Wallet Info' )
    end
    # Notification email
    def send_notification_email(name,email)
		@name=name
		mail( 
        	:to => email,
    		:subject => 'Viralcents: Subscription Email Changed' )
    end
end
