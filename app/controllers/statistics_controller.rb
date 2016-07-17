class StatisticsController < ApplicationController
	def current_month
		@rides = current_user.rides.current_month.group_by {|ride| ride.created_at.strftime("%B,#{ride.created_at.day.ordinalize}")}
	end

	def current_week
		@rides = current_user.rides.current_week
	end
end