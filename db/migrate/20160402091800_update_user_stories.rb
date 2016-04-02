class UpdateUserStories < ActiveRecord::Migration
  def change
  	add_column :user_stories, :old_clicks, :integer,:default=>0
  	add_column :user_stories, :old_likes, :integer,:default=>0
  	add_column :user_stories, :old_shares, :integer,:default=>0
  	add_column :user_stories, :old_comments, :integer,:default=>0
  	add_column :user_stories, :old_fav, :integer,:default=>0
  	add_column :user_stories, :old_retweets, :integer,:default=>0
  	remove_column :stories, :conversation_amt, :float
  	remove_column :user_stories , :conversation,:integer
  end
end
