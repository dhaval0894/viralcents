class AddColStory < ActiveRecord::Migration
  def change
  	add_column :stories, :story_status, :string, :default => "active"
  end
end
