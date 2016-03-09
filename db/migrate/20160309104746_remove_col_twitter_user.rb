class RemoveColTwitterUser < ActiveRecord::Migration
  def change
  	remove_column :twitter_users, :twitter_provider
  	add_column :twitter_users, :provider, :string
  end
end
