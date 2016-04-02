class Recharge < ActiveRecord::Migration
  def change
  	create_table :recharges do |t|
  		t.string :mobile
  		t.float :amount , :default => 0.0
  		t.integer :pay_id
  		t.integer :user_id
  	end
  	add_foreign_key :recharges, :users
  	change_column :wallets, :balance, :float, :default => 0.0
  end
end
