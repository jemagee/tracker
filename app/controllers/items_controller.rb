class ItemsController < ApplicationController

	def index
		@items = Item.all
	end

	def new
		@item = Item.new
	end
	

	def create
		@item = Item.new(item_params)
		if @item.save
			flash[:success] = "Item Successfully Created!"
			redirect_to @item
		else
			flash[:warning] = "Item Not Created!"
			render 'new'
		end
	end

	def show
		@item = Item.find(params[:id])
	end

	private

		def item_params
			params.require(:item).permit(:name)
		end
end
