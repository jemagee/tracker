class VendorsController < ApplicationController

	before_action :get_vendor, only: [:show, :edit, :update, :destroy]

	def index
		@vendors = Vendor.all
	end

	def new
		@vendor = Vendor.new
	end

	def create
		@vendor = Vendor.new(vendor_params)
		if @vendor.save
			flash[:success] = "Vendor Successfully Entered"
			redirect_to vendors_path
		else
			flash.now[:warning] = "Vendor Not Added"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @vendor.update(vendor_params)
			flash[:success] = "Vendor Successfully Updated"
			redirect_to @vendor
		else
			flash[:warning] = "Vendor Not Updated"
			render 'edit'
		end
	end

	def destroy
		@vendor.destroy
		flash[:success] = "Vendor Successfully Deleted"
		redirect_to vendors_path
	end


	private

		def vendor_params
			params.require(:vendor).permit(:name, :contact, :contact_email)
		end

		def get_vendor
			@vendor = Vendor.find(params[:id])
		end
end
