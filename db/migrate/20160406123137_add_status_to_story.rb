class AddStatusToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :status, :string
  end
end
