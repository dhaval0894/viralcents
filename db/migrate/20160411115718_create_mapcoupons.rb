class CreateMapcoupons < ActiveRecord::Migration
  def change
    create_table :mapcoupons do |t|
      t.string :coupon_id
      t.string :user_id

      t.timestamps null: false
    end
  end
end
