class ProductsController < ApplicationController

	def ws_gateway
		@product_ws_request = Product.where({id: [params[:product_ids]]})
		respond_to do |format|
			# DEACTIVATE PRODUCTS=============================================
			if params[:deactivate_selected]
				# ACTIVE = 0 SQLITE, if database is not SQLITE use false instead of 0
				if @product_ws_request.update_all("active = 0")
					format.json {render :nothing => true, status: 200}
				else
					format.json {render :nothing => true, status: 400}
				end
			
			# ACTIVATE PRODUCTS===============================================
			elsif params[:activate_selected]
				if @product_ws_request.update_all("active = 1")
					format.json {render :nothing => true, status: 200}
				else
					format.json {render :nothing => true, status: 400}
				end
			
			# DELETE PRODUCTS=================================================
			elsif params[:delete_selected]
				if @product_ws_request.delete_all
					format.json {render :nothing => true, status: 200}
				else
					format.json {render :nothing => true, status: 400}
				end
			end	
		end			
	end

	def activate
		@product = Product.find(params[:id])
		
		respond_to do |format|
			if @product.update_attribute(:activate, "1")
				format.json {render :nothing => true, status: 200}
				format.js {render :nothing => true, status: 200}
			else
				format.json {render :nothing => true, status: 400}
				format.js {render :nothing => true, status: 400}
			end
		end
	end

	def deactivate
		@product = Product.find(params[:id])
		
		respond_to do |format|
			if @product.update_attribute(:activate, "0")
				format.json {render :nothing => true, status: 200}
				format.js {render :nothing => true, status: 200}
			else
				format.json {render :nothing => true, status: 400}
				format.js {render :nothing => true, status: 400}
			end
		end
	end

	def filter
		@products_index = Product.where("category_id = ?", params[:product][:category_id])
		render "index"
	end

	def index
		@products_index = Product.all
	end

	def show
		@product = Product.find(params[:id])
	end

	def edit

		@product = Product.find(params[:id])
	end

	def update
		params.permit!
		@procuct = Product.find(params[:id])
		respond_to do |format|
			if @product.save
				format.html {redirect_to @product }
				format.json {head :no_content}
			else
				format.html { render action: edit }
				format.json { render json: @product.errors,
				 status: :unprocessable_entity	}
			end
		end
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
		@product = Product.find(params[:id])
	    @product.destroy
	end

	def product_params
	    params.permit(:name, :price, :active, :category_id)
	end

end