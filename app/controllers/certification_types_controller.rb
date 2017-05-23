class CertificationTypesController < ApplicationController

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
		@certtype = CertificationType.find(params[:id])
	end

	private

		def type_params
			params.require(:certification_type).permit(:name)
		end
end
