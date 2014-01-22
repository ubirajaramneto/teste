class ProductsController < ApplicationController

	def ws_gateway
		respond_to do |format|
			if params[:deactivate_selected]
				@product_ws_request = Product.where({id: [params[:product_ids]]}).update_all("active = 0")
				format.json {render :nothing => true, status: 200}
			else
				format.json {render :nothing => true, status: 400}	
			end
		end			
	end

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
		params.permit!
		@product = Product.new(params[:product])
		if @product.save
			redirect_to root_path
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

	private
	def deactivate_selected(product_array)
		product_array.each do |product|
			product.update_attribute(:active => false)
		end 
	end

	def product_params
	    params.permit(:name, :price, :active, :category_id)
	end

end