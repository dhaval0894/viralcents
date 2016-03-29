class MailSender

	@queue = :mail_queue

	def self.perform()

		
		    require 'sendgrid-ruby'
		      sendgrid = SendGrid::Client.new do |c|
		        end

		      email = SendGrid::Mail.new do |m|
		          m.to      = ''
		          m.from    = ''
		          m.subject = ''
		          m.html    = ''
		        end
		    sendgrid.send(email)

		
	end



end