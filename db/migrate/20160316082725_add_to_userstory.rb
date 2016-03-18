class AddToUserstory < ActiveRecord::Migration
  def change
  	add_column :user_stories, :fb_post_id, :string
  	add_column :user_stories, :tw_post_id, :string
  end
end
