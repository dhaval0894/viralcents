ActiveAdmin.register Story do
# story resource for admin
	config.filters = false
	permit_params :title, :orig_url, :click_amt, :like_amt,:share_amt,:comment_amt,:fav_amt,:retweet_amt,:conversation_amt,:admin_user_id
	
	controller do
	    def scoped_collection
	    	#show all for superadmin
	    	if current_admin_user.role == "superadmin"
	    		Story.all
	    	else
    			Story.where(:admin_user_id => current_admin_user.id)      
    		end
	    end
	end
	index do
	 	  selectable_column
		  id_column
		  column :orig_url
		  column :created_at
		  column :updated_at
		  column :admin_user_id	
	end	

	form do |f|
	    f.inputs "Story" do
	      f.input :orig_url
	      f.hidden_field :admin_user_id, value: current_admin_user.id
	      f.input :click_amt
	      f.input :like_amt
	      f.input :share_amt
	      f.input :comment_amt
	      f.input :fav_amt
	      f.input :retweet_amt
	      f.input :conversation_amt
	    end
	    f.actions
	end	  

end
