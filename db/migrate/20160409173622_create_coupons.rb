class CreateCoupons < ActiveRecord::Migration
  def change
    create_table :coupons do |t|
      t.string :coupon_title
      t.string :coupon_company_name
      t.string :coupon_company_logo
      t.integer :coupon_amount
      t.string :coupon_description
      t.string :coupon_terms

      t.timestamps null: false
    end
  end
end
