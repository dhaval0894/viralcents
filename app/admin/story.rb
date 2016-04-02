ActiveAdmin.register Story do
# story resource for admin
	config.filters = false
	permit_params :title, :orig_url, :admin_user_id	
	
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
	    end
	    f.actions
	end	  

end
