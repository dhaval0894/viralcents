# Preview all emails at http://localhost:3000/rails/mailers/story_mailer
class StoryMailerPreview < ActionMailer::Preview
	def send_story_email
	    StoryMailer.send_story_email(User.find(1))
	end
end
