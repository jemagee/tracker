class VendorsController < ApplicationController

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

	private

		def vendor_params
			params.require(:vendor).permit(:name, :contact, :contact_email)
		end
end
