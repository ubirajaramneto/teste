class CategoriesController < ApplicationController

	def create
		params.permit!
		@category = Category.new(params[:category])
		respond_to do |format|
			if @category.save
				format.json {render :nothing => true, :status => 200 }
		  		format.js {render :nothing => true, :status => 200 }
		  		format.html {render :nothing => true, :status => 200 }
		  	else 
		  		format.json {render :nothing => true, :status => 400 }
			end
		end
	end

	private

	def categories_params
		params(:category).permit(:name)
	end

end
