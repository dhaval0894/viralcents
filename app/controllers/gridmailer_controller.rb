class GridmailerController < ApplicationController
  
  def index
  end

  def themail

   Resque.enqueue(MailSender)


  end

  	  def index
	  end


	def message

            Resque.enqueue(MessageSender)
	end
  

end






