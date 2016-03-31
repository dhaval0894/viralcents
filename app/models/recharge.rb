class Recharge < ActiveRecord::Base
	belongs_to :user
	has_many :recharge_stat


end