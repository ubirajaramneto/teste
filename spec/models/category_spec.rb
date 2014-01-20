require 'spec_helper'

describe Category do
	
	it "ensures presence validation" do
		category = Category.new
		expect(category).to have(1).error_on(:name)
	end

	it "ensures uniqueness validation" do
		category = Category.create!(:name => "roupas")
		category1 = Category.new(:name => "roupas")
		expect(category1).to have(1).error_on(:name)
	end
end
