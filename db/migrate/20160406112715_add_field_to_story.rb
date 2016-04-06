class AddFieldToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :total_budget, :float
  	add_column :stories, :published, :boolean, :default => false
  end
end
