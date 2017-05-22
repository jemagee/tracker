class TypesController < ApplicationController

	def index
		@types = Type.all
	end

	def new
		@type = Type.new
	end

	def create
		@type = Type.create(type_params)
		flash[:success] = "New Certification Type Added!"
		redirect_to types_path
	end

	private

		def type_params
			params.require(:type).permit(:name)
		end
end
