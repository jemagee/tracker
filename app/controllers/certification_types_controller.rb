class CertificationTypesController < ApplicationController

	def index
		@types = CertificationType.all
	end

	def new
		@type = CertificationType.new
	end

	def create
		@type = CertificationType.create(type_params)
		flash[:success] = "New Certification Type Added!"
		redirect_to certification_types_path
	end

	private

		def type_params
			params.require(:certification_type).permit(:name)
		end
end
