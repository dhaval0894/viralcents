class Usertransaction < ActiveRecord::Migration
  def change
  	create_table :user_transactions do |t|
  		t.float :amt , :default=>0.0
  		t.datetime :trans_date
  		t.string :trans_type
  		t.integer :user_id
  	end
  	add_foreign_key :user_transactions, :users
  end
  def down
    drop_table :transactions
  end

end
