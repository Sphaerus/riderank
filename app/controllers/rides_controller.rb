class RidesController < ApplicationController
	def create
		@ride = current_user.rides.build
		@start_address = @ride.build_start_address
		@destination_address = @ride.build_destination_address
		@ride.assign_attributes(ride_params)

		respond_to do |format|
			byebug
			if @ride.save
				format.html {redirect_to root_path, notice: "Ride successfully created!"}
			else
				format.html {redirect_to root_path, alert: "Ride could not be successfully created!"}
			end
		end
	end

	private

	def ride_params
		params.require(:ride).permit(:user_id, :price, start_address_attributes: [:street, :city, :country], destination_address_attributes: [:street, :city, :country])
	end
end