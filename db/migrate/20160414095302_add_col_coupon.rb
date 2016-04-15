class AddColCoupon < ActiveRecord::Migration
  def change
  	add_column :coupons ,:coupon_code,:string
  	add_column :coupons, :expiry_date,:date
  end
end
