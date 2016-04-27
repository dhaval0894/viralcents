# Preview all emails at http://localhost:3000/rails/mailers/viralcents_mailer
class ViralcentsMailerPreview < ActionMailer::Preview
	def send_notification_email
	    ViralcentsMailer.send_notification_email('Aditi','a.thakur73.at@gmail.com')
	end
	def send_wallet_email
	    ViralcentsMailer.send_wallet_email('Aditi',50,10,'a.thakur73.at@gmail.com')
	end
	def send_story_email
	    ViralcentsMailer.send_story_email('Aditi','a.thakur73.at@gmail.com')
	end
end
