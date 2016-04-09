class DeleteWrongTableCoupons < ActiveRecord::Migration
  def change
  	drop_table :coupons
  end
end
