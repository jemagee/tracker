class CertificationTypesController < ApplicationController

	def index
		@certtypes = CertificationType.all
	end

	def new
		@certtype = CertificationType.new
	end

	def create
		@certtype = CertificationType.create(type_params)
		flash[:success] = "New Certification Type Added!"
		redirect_to certification_types_path
	end

	def show
		@certtype = CertificationType.find(params[:id])
	end

	private

		def type_params
			params.require(:certification_type).permit(:name)
		end
end
