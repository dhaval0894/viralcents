class AddCreatedByAdminUser < ActiveRecord::Migration
  def change
  	add_column :stories, :admin_user_id , :integer
  	add_foreign_key :stories, :admin_users
  end
end
