class UserPanelController < ApplicationController
	before_action :check_user, only: [:dashboard, :stories]
	def dashboard
		respond_to do |format|
      		format.html
      		format.js
  		end
	end

	def stories
	end

	private

	def check_user
		if current_user.nil?
			redirect_to root_path
		end
	end
end
