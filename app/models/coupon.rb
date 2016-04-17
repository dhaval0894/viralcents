class Coupon < ActiveRecord::Base
	
	 has_many :mapcoupon

	mount_uploader :coupon_company_logo, ImageUploader

    
end
