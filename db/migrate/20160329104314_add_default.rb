class AddDefault < ActiveRecord::Migration
  def change
  	change_column :user_stories, :clicks, :integer, :default => 0
  	change_column :user_stories, :fb_likes, :integer, :default => 0
  	change_column :user_stories, :fb_shares, :integer, :default => 0
  	change_column :user_stories, :fb_comments, :integer, :default => 0
  	change_column :user_stories, :fav, :integer, :default => 0
  	change_column :user_stories, :retweets, :integer, :default => 0
  	change_column :user_stories, :conversation, :integer, :default => 0
  	change_column :stories, :click_amt, :float, :default => 0.0
  	change_column :stories, :like_amt, :float, :default => 0.0
  	change_column :stories, :share_amt, :float, :default => 0.0
  	change_column :stories, :comment_amt, :float, :default => 0.0
  	change_column :stories, :fav_amt, :float, :default => 0.0
  	change_column :stories, :retweet_amt, :float, :default => 0.0
  	change_column :stories, :conversation_amt, :float, :default => 0.0
  end
end
