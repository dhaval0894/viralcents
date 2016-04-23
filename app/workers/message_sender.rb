class MessageSender


  include Sidekiq::Worker

  #sidekiq_options queue: "low"




	def perform()
				require 'net/http'
				uri = URI('http://sms.hspsms.com:/sendSMS')
				params = {:username => "secret", 
					      :message => "the day was cool",
					      :sendername =>"VIRALS",
					      :smstype =>"TRANS",
					      :numbers => "number",
					      :apikey =>"secret"}
				uri.query = URI.encode_www_form(params)
				res = Net::HTTP.get_response(uri)
				puts res.body if res.is_a?(Net::HTTPSuccess)
		
		
	end



end