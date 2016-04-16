class WalletInfo

  include Sidekiq::Worker
  
  # include Sidetiq::Schedulable

    # recurrence backfill: true do
      # minutely
   # end



  def perform()

require 'SmtpApiHeader.rb'
require 'mail'
require 'json'

Mail.defaults do
  delivery_method :smtp, { :address   => 'smtp.sendgrid.net',
                           :port      => 587,
                           :domain    => 'sendgrid.com',
                           :user_name => 'rajiv-shrivastava',
                           :password  => 'rajiv834',
                           :authentication => 'plain',
                           :enable_starttls_auto => true }
end

hdr = SmtpApiHeader.new

receiver = ['rjv834@gmail.com','maheshwari.kajol@gmail.com']

hdr.addTo(receiver)

hdr.setUniqueArgs({'test' => 1 ,'foo' =>2})

x = "rajiv"
y ="kaju"

hdr.addSubVal("-name-" ,[x,y])

hdr.setCategory('yourCategory')


mail = Mail.deliver do
  header['X-SMTPAPI'] =  hdr.asJSON()
  to 'willnotdeliver@domain.com' # When using SMTPAPI's 'to' parameter, this address will not get delivered to
  from 'viralcents@gmil.com'
  subject 'Ruby Example using X-SMTPAPI header'
  text_part do
    body 'You  would put your content here, but I am going to say: Hello world!'
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body '<b>Hello world!</b> -name-<br>Glad to have you here!'
  end
end




  end



end







