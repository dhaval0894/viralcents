class AddContactToUser < ActiveRecord::Migration
  
  def change
  	add_column :users ,:contact ,:integer
  end

end
