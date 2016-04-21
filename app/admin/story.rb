ActiveAdmin.register Story do
# story resource for admin
	#config.filters = false
	config.batch_actions = false
	permit_params :title, :orig_url, :click_amt, :like_amt,:share_amt,:comment_amt,:fav_amt,:retweet_amt,:conversation_amt,:admin_user_id, :total_budget, :expiry_date, :category_id, :story_status
	
	breadcrumb do
  	end

  	#filters
  	filter :orig_url
  	filter :category
  	filter :story_status
  	filter :created_at

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
		  column :total_budget
		  column :story_status
		  column :category_id
		  actions
	end	
	
	#form fields for new story
	form do |f|
	    f.inputs "Story" do
		  f.input :orig_url, :label => "Post URL"
	      f.hidden_field :admin_user_id, value: current_admin_user.id
	      f.input :total_budget
	      f.input :click_amt
	      f.input :like_amt
	      f.input :share_amt
	      f.input :comment_amt
	      f.input :fav_amt
	      f.input :retweet_amt
	      f.input :story_status, :as => :select, 
                :label => "Story Status", :include_blank => false,
                :collection => [['Active','active'],['Pause','pause'],['Expire','expire']]
          f.input :category_id,:as => :select, :collection =>Category.where.not(name: 'All').collect{|category| [category.name,category.id]}, :prompt => true
		end 

		f.actions
	end


end
