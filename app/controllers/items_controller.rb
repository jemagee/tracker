class ItemsController < ApplicationController

	before_action :get_item, only: [:show, :edit, :update]

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
	end

	def edit
	end

	def update
		@item.update(item_params)
		flash[:success] = "Item Updated Successfully!"
		redirect_to @item
	end


	private

		def item_params
			params.require(:item).permit(:name)
		end

		def get_item
			@item = Item.find(params[:id])
		end
end