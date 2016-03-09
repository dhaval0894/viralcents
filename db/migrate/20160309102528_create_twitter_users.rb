class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :twitter_provider
      t.string :twitter_uid
      t.string :twitter_name
      t.string :twitter_oauth_token
      t.string :twitter_oauth_secret

      t.timestamps null: false
    end
  end
end
