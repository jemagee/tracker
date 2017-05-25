class CertificationsController < ApplicationController

	before_action :get_type, only: [:edit, :show, :update, :destroy]

	def index
		@certifications = Certification.all
	end

	def new
		@certification = Certification.new
	end

	def create
		@certification = Certification.new(certification_params)
		if @certification.save
			flash[:success] = "New Certification Added!"
			redirect_to certifications_path
		else
			flash.now[:danger] = "New Certification Not Added!"
			render 'new'
		end
	end

	def show
	end

	def edit
	end

	def update
		if @certification.update(certification_params)
			flash[:success] = "Certification Successfully Updated!"
			redirect_to @certification
		else 
			flash.now[:danger] = "Certification Not Updated!"
			render 'edit'
		end
	end

	def destroy 
		@certification.destroy
		flash[:success] = "Certification Successfully Deleted!"
		redirect_to certifications_path
	end

	private

		def certification_params
			params.require(:certification).permit(:name)
		end

		def get_type
			@certification = Certification.find(params[:id])
		end
end
