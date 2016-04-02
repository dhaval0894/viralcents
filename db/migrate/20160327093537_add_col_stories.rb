class AddColStories < ActiveRecord::Migration
  def change
  	add_column :stories, :click_amt, :float
  	add_column :stories, :like_amt, :float
  	add_column :stories, :share_amt, :float
  	add_column :stories, :comment_amt, :float
  	add_column :stories, :fav_amt, :float
  	add_column :stories, :retweet_amt, :float
  	add_column :stories, :conversation_amt, :float
  end
end
