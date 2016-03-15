class AddImageurlToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :image_url, :string
  end
end
