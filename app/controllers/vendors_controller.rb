class VendorsController < ApplicationController

	before_action :get_vendor, only: [:show, :edit, :update, :destroy]
	before_action :check_email, only: [:update, :create]

	def index
		@vendors = Vendor.all
	end

	def new
		@vendor = Vendor.new
		@vendor.vendor_certifiers.build
	end

	def create
		@vendor = Vendor.new(vendor_params)
		if @vendor.save
			flash[:success] = "Vendor Successfully Entered!"
			redirect_to vendors_path
		else
			flash.now[:danger] = "Vendor Not Added"
			render 'new'
		end
	end

	def show
	end

	def edit
		@vendor.vendor_certifiers.build
	end

	def update
		if @vendor.update(vendor_params)
			flash[:success] = "Vendor Successfully Updated!"
			redirect_to @vendor
		else
			flash.now[:danger] = "Vendor Not Updated"
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
			if params["vendor"]["contact_email"].length == 0
				params["vendor"]["contact_email"] = nil
			end
			params.require(:vendor).permit(:name, :contact, :contact_email, vendor_certifiers_attributes: [:vendor_id, :certifier_id, :expires_on])
		end

		def get_vendor
			@vendor = Vendor.find(params[:id])
		end

		def check_email
		end
end
