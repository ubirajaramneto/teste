class Category < ActiveRecord::Base

	#==========VALIDATIONS=================
	validates :name, :presence => true, :uniqueness => true,
		:uniqueness => { :case_sensitive => false }
	#====================================== 

end
