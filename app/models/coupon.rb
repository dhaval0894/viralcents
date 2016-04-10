class Coupon < ActiveRecord::Base
	mount_uploader :coupon_title, ImageUploader
	mount_uploader :coupon_company_logo, ImageUploader

end
