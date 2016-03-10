class CreateUserStories < ActiveRecord::Migration
  def change
    create_table :user_stories do |t|
    	t.string :short_url
    	t.integer :clicks
    	t.integer :fb_likes
    	t.integer :fb_shares
    	t.integer :fb_comments
    	t.integer :retweets
    	t.integer :conversation
    	t.integer :fav
    	t.integer :user_id
    	t.integer :story_id

      t.timestamps null: false
    end
    add_foreign_key :user_stories, :users
    add_foreign_key :user_stories, :stories
  end
end
