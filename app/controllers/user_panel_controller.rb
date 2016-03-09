class UserPanelController < ApplicationController
	#before_action :login_state, only: [:dashboard]
	def dashboard
		respond_to do |format|
      		format.html
      		format.js 
  		end
	end

	private
		def login_state
			respond_to do |format|
    			format.js { render :js => "checkLoginState();" }  
  			end
		end
end
