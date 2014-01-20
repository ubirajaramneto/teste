class ProductsController < ApplicationController

	def index
		@products_index = Product.all
	end

	def show
	end

	def edit
	end

	def update
	end

	def new
		@product = Product.new
	end

	def create
		@product = Product.new (params[:product])
		if @product.save
			redirect_to index_path
		else
			render 'new'
		end
	end

	def destroy
	end

	def destroy_selected
	end

	def activate
	end

	def deactivate
	end

	def activate_selected
	end

	def deactivate_selected
	end

end