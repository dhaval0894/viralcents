class NotificationMessageSender


  include Sidekiq::Worker

  sidekiq_options queue: "low"

  

  def perform(contact)

    contact_number = contact

        require 'net/http'
        uri = URI('http://sms.hspsms.com:/sendSMS')
        params = {:username => "nitesh.mishra143@gmail.com", 
                :message => "Viralcents Notifications are now active on this number.",
                :sendername =>"VIRALS",
                :smstype =>"TRANS",
                :numbers => contact_number,
                :apikey =>"eaf93dbe-bf68-43c7-8e47-c7a38bae0371"}
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)
    
    
  end



end
