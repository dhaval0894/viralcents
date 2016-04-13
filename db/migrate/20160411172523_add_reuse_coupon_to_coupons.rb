class AddReuseCouponToCoupons < ActiveRecord::Migration
  def change
  	add_column :coupons ,:coupon_reuse ,:boolean , :default => false
  end
end
