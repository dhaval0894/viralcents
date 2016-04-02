class RemColRecharge < ActiveRecord::Migration
  def change
  	remove_column :recharges, :amount
  	add_column :recharge_stats, :amount, :float, :default => 0.0
  end
end
