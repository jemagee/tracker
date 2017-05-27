class CertifiersController < ApplicationController

	before_action :get_certifier, only: [:show, :edit, :update, :destroy]

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
	end

	def edit
	end

	def update
		if @certifier.update(certifier_params)
			flash[:success] = "Certifier Updated Successfully!"
			redirect_to @certifier
		else
			flash.now[:danger] = "Certifier Not Updated!"
			render 'edit'
		end
	end

	private

		def certifier_params
			params.require(:certifier).permit(:organization, :certification_id)
		end

		def get_certifier
			@certifier = Certifier.find(params[:id])
		end
end
