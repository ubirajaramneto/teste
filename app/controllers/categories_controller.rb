class CategoriesController < ApplicationController

	def create
		params.permit!
		@category = Category.new(params[:category])
		respond_to do |format|
			if @category.save
				format.json {render :nothing => true, :status => 200 }
		  		format.js {render :nothing => true, :status => 200 }
		  		format.html {render :nothing => true, :status => 200}
		  	else 
		  		format.json {render :nothing => true, :status => 400 }
			end
		end
	end

	def get_categories
		@categories = Category.all

		respond_to do |format| 
			format.json {render :json => @categories, :status => 200}	
		end
	end

	private

	def categories_params
		params(:category).permit(:name)
	end

end
