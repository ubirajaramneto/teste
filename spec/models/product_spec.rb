require 'spec_helper'

describe Product do
	it "tests presence validation for all object fields" do
		product = Product.new(:name => "", :price => "gh", :active => "", :category_id => "")
		expect(product).to have(1).error_on(:name)
		expect(product).to have(1).error_on(:price)
		expect(product).to have(1).error_on(:active)
	end

	it "tests the numeracality of the price field" do
		product = Product.new(:name => "chocolate", :price => 0.00, :active => true, :category_id => 2)
		expect(product).to have(1).error_on(:price)
	end

	it "tests the association of the product in a category" do
		Product.create(:name => "chocolate", :price => 2.00, :active => true, :category_id => nil)
		expect(Product).to have(0).record
	end

end
