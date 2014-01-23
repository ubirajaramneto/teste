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
			if @product.update_column(:active, "1")
				format.html {redirect_to(product_url)}
				format.json {head :no_content}
				format.js {render :layout => false}
			end
		end
	end

	def deactivate
		@product = Product.find(params[:id])
		respond_to do |format|
			if @product.update_column(:active, "0")
				format.html {redirect_to(product_url)}
				format.json {head :no_content}
				format.js {render :layout => false}
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
		@product = Product.find(params[:id])
		respond_to do |format|
			if @product.update_attributes(params[:product])
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
	    respond_to do |format|
	      format.html { redirect_to product_url }
	      format.json { head :no_content }
	      format.js   { render :layout => false }
	    end
	end

	def product_params
	    params.permit(:name, :price, :active, :category_id)
	end

end