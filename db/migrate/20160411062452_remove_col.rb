class RemoveCol < ActiveRecord::Migration
  def change
  	remove_column :stories, :category
  	remove_column :stories, :status
  end
end
