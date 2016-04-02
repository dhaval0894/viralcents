class AddWallet < ActiveRecord::Migration
  def change
  	create_table :transactions do |t|
  		t.float :amt
  		t.datetime :trans_date
  		t.string :type
  		t.integer :user_id
  	end

  	create_table :wallets do |w|
  		w.float :balance
  		w.integer :user_id
  	end
  	add_foreign_key :transactions, :users
  	add_foreign_key :wallets, :users
  end
end
