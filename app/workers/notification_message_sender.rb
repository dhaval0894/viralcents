class NotificationMessageSender

  @queue = :message_queue

  def self.perform()

        require 'net/http'
        uri = URI('http://sms.hspsms.com:/sendSMS')
        params = {:username => "", 
                :message => "check with activeadmin",
                :sendername =>"VIRALS",
                :smstype =>"TRANS",
                :numbers => "",
                :apikey =>""}
        uri.query = URI.encode_www_form(params)
        res = Net::HTTP.get_response(uri)
        puts res.body if res.is_a?(Net::HTTPSuccess)
    
    
  end



end
