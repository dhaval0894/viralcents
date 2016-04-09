ActiveAdmin.register Story do
# story resource for admin
	config.filters = false
	config.batch_actions = false
	permit_params :title, :orig_url, :click_amt, :like_amt,:share_amt,:comment_amt,:fav_amt,:retweet_amt,:conversation_amt,:admin_user_id, :total_budget, :expiry_date, :category_id
	
	breadcrumb do
  	end

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
		  render partial: 'search'
		  selectable_column
		  id_column
		  column :orig_url
		  column :created_at
		  column :total_budget
		  column :click_amt
		  column :like_amt
		  column :share_amt
		  column :comment_amt
		  column :fav_amt
		  column :retweet_amt
		  column :category_id
		  actions
	end	


	form do |f|
	    f.inputs "Story" do

	      render partial: 'new', locals: {
          f: f
        } 
        
        f.input :category_id,:as => :select, :collection =>Category.all.collect{|category| [category.name,category.id]}, :prompt => true
		end 
		f.actions
	end


end
