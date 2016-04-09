class Coupon < ActiveRecord::Base
	mount_uploader :coupon_title, ImageUploader
end
