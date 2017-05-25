class CertifiersController < ApplicationController

	def new
		@certifier = Certifier.new
	end
end
