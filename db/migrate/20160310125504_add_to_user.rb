class AddToUser < ActiveRecord::Migration
  def change
  	add_column :twitter_users, :user_id, :integer
  	add_foreign_key :twitter_users, :users

  	add_column :users, :notification_type, :string
  	add_column :users, :email, :string
  end
end
