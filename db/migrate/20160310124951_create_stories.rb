class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
    	t.string :title
    	t.string :orig_url

      t.timestamps null: false
    end
  end
end
