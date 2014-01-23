require 'spec_helper'

describe ProductsController do
	# testing rendering of static pages
	describe "GET index" do
		it "renders index template" do
	    	get :index
	    	expect(response).to render_template("index")
	    end
	end

	describe "GET new" do
		it "renders new product template" do
	    	get :new
	    	expect(response).to render_template("new")
	    end
	end
end
