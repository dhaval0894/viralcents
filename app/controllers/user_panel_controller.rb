class UserPanelController < ApplicationController
	#before_action :login_state, only: [:dashboard]
	def dashboard
		if current_user.nil?
			redirect_to root_path
	  	else
	  		respond_to do |format|
	      		format.html
	      		format.js
	  		end
	  	end
	end

	def stories
	end
end
