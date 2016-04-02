class StaticPagesController < ApplicationController
  layout "landing"

  def index
  	#check if user is logged in
  	if not current_user.nil?
  		redirect_to dashboard_path
  	end
  end
end
