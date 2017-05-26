class CertifiersController < ApplicationController

	def new
		@certifier = Certifier.new
	end

	def create
		@certifier = Certifier.new(certifier_params)
		@certifier.save
		flash[:success] = "Certifier Successfully Created!"
		redirect_to certifier_path(@certifier)
	end

	def show
		@certifier = Certifier.find(params[:id])
	end

	private

		def certifier_params
			params.require(:certifier).permit(:organization, :certification_id)
		end
end
