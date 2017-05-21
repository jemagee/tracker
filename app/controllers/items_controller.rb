class ItemsController < ApplicationController

	def new
		@item = Item.new
	end
	

	def create
		@item = Item.create(item_params)
		flash[:success] = "Item Successfully Created!"
		redirect_to @item
	end

	def show
		@item = Item.find(params[:id])
	end

	private

		def item_params
			params.require(:item).permit(:name)
		end
end
