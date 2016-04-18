class StaticPagesController < ApplicationController
  layout "landing"

  def index
  	#check if user is logged in
  	if not current_user.nil?
  		redirect_to dashboard_path
  	end
  end

  #add contacts and messages
  def add_contact
    if !params[:email].nil? and !params[:message].nil?
      @contact = Contact.new(email: params[:email], message: params[:message])
      @contact.save
      flash[:alert] = "Your message has been sent"
    end
    redirect_to '/'
  end
end
