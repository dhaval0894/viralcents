class WalletInfo < SmtpApiHeader

  include Sidekiq::Worker
  include Sidetiq::Schedulable

    recurrence backfill: true do
      minutely
   end


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

@mails = hdr.user_mail_info   # getting user emails from method user_mail_info

receiver = @mails

hdr.addTo(receiver)

hdr.setUniqueArgs({'test' => 1 ,'foo' =>2})


money = hdr.wallet_info     # getting user money from method wallet_info
names = hdr.user_names            # getting user name from method user_name_info

hdr.addSubVal("-amount-" ,money) #adding money to a html variable amount for each user
hdr.addSubVal("-name-" ,names)   #adding name to a html variable name for each user


hdr.setCategory('yourCategory')


mail = Mail.deliver do
  header['X-SMTPAPI'] =  hdr.asJSON()
  to 'willnotdeliver@domain.com' # When using SMTPAPI's 'to' parameter, this address will not get delivered to
  from 'Viralcents'
  subject 'Viralcents Wallet'
  text_part do
    body ''
  end
  html_part do
    content_type 'text/html; charset=UTF-8'
    body '<b>Hello </b> Rs. -amount-<br>Glad to have you here!'
  end
end




  end



end












  
