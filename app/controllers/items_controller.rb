class ItemsController < ApplicationController

	before_action :get_item, only: [:show, :edit, :update, :destroy]

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
			flash.now[:danger] = "Item Not Created!"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @item.update(item_params)
			flash[:success] = "Item Updated Successfully!"
			redirect_to @item
		else
			flash.now[:danger] = "Item Not Updated!"
			render 'edit'
		end
	end

	def destroy
		@item.destroy
		flash[:success] = "Item Deleted Successfully!"
		redirect_to items_path
	end


	private

		def item_params
			params.require(:item).permit(:name, certification_type_ids: [])
		end

		def get_item
			@item = Item.find(params[:id])
		end
end
