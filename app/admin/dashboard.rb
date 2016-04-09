ActiveAdmin.register_page "Dashboard" do
  #Dashboard for admin_panel
  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }
  content :title => proc{ I18n.t("active_admin.dashboard") } do
      
      if current_admin_user.role == "superadmin"
        table_for Story.order("created_at desc").limit(5) do
            column :title
            column :orig_url
            column :total_budget
            column :click_amt
            column :like_amt
            column :share_amt
            column :comment_amt
            column :fav_amt
            column :retweet_amt
            actions
        end
      else
        @stories = Story.where(:admin_user_id => current_admin_user.id).order("created_at desc").limit(5)
        render partial: 'dashboard', locals: {
          stories: @stories
        }  
      end
        
        strong {link_to "View all stories", admin_stories_path}
  end
end
