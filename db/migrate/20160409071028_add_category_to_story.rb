class AddCategoryToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :category_id, :integer
  	add_foreign_key :stories, :categories
  end
end
