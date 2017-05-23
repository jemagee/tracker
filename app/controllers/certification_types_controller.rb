class CertificationTypesController < ApplicationController

	before_action :get_type, only: [:edit, :show, :update, :destroy]

	def index
		@certtypes = CertificationType.all
	end

	def new
		@certtype = CertificationType.new
	end

	def create
		@certtype = CertificationType.new(type_params)
		if @certtype.save
			flash[:success] = "New Certification Type Added!"
			redirect_to certification_types_path
		else
			flash.now[:danger] = "New Certification Type Not Added!"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @certtype.update(type_params)
			flash[:success] = "Certification Type Successfully Updated!"
			redirect_to @certtype
		else 
			flash.now[:danger] = "Certification Type Not Updated!"
			render 'edit'
		end
	end

	def destroy 
		@certtype.destroy
		flash[:success] = "Certification Type Successfully Deleted!"
		redirect_to certification_types_path
	end

	private

		def type_params
			params.require(:certification_type).permit(:name)
		end

		def get_type
			@certtype = CertificationType.find(params[:id])
		end
end
