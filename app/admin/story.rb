ActiveAdmin.register Story do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end
	permit_params :title, :orig_url, :click_amt, :like_amt,:share_amt,:comment_amt,:fav_amt,:retweet_amt,:conversation_amt
	form do |f|
    f.inputs "Story" do
      f.input :orig_url
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
