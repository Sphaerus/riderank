class HomeController < ApplicationController
	def index
		@ride = current_user.rides.build
		@start_address = @ride.build_start_address
		@destination_address = @ride.build_destination_address
	end
end