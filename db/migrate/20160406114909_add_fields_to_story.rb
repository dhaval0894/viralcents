class AddFieldsToStory < ActiveRecord::Migration
  def change
  	add_column :stories, :category, :string
  	add_column :stories, :expiry_date, :datetime
  end
end
