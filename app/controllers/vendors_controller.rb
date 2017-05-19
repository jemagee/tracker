class VendorsController < ApplicationController

	def index
		@vendors = Vendor.all
	end

	def new
		@vendor = Vendor.new
	end

	def create
		@vendor = Vendor.create(vendor_params)
		flash[:success] = "Vendor Successfully Entered"
		redirect_to vendors_path
	end

	private

		def vendor_params
			params.require(:vendor).permit(:name, :contact, :contact_email)
		end
end
