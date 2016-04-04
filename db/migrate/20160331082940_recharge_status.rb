class RechargeStatus < ActiveRecord::Migration
  def change
  	create_table :recharge_stats do |t|
  		t.integer :pay_id
  		t.integer :recharge_id
  	end
  
  remove_column :recharges, :pay_id
  add_foreign_key :recharge_stats, :recharges
  end
end
