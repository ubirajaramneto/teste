class Product < ActiveRecord::Base
	belongs_to :category

	#=======VALIDATIONS========

	validates_associated :category
	validates :category, :presence => true
	validates :name, :length => {maximum: 30}, :presence => true
	validates :price, :numericality => {:greater_than => 0}, :presence => true
	validates :active, :presence => true

	#==========================
end
