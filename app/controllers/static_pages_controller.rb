class StaticPagesController < ApplicationController
  layout "landing"

  def index
  	if not current_user.nil?
  		redirect_to dashboard_path
  	end
  end
end
