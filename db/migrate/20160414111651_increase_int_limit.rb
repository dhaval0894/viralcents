class IncreaseIntLimit < ActiveRecord::Migration

  	  def change
    	change_column :users ,:contact ,:integer ,:limit=>8

     end
end
