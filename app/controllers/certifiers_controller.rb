class CertifiersController < ApplicationController

	def new
		@certifier = Certifier.new
	end

	def create
		@certifier = Certifier.new(certifier_params)
		if @certifier.save
			flash[:success] = "Certifier Successfully Created!"
			redirect_to certifier_path(@certifier)
		else
			flash.now[:danger] = "Certifier Not Created!"
			render 'new'
		end
	end

	def show
		@certifier = Certifier.find(params[:id])
	end

	private

		def certifier_params
			params.require(:certifier).permit(:organization, :certification_id)
		end
end
