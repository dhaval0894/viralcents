class MessagesController < ApplicationController
	  def index
	  end


	def message

            Resque.enqueue(MessageSender)
	end
  

end
