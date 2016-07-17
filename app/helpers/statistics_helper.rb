module StatisticsHelper
	def sum_of_rides_in_km(rides)
		sum = (rides.map{ |ride| ride.distance}.sum.to_f)/1000
		in_km(sum)
	end

	def avg_ride_in_km(rides)
		return in_km(0) if rides.count == 0
		avg_dist = (rides.map { |ride| ride.distance}.sum/(rides.count)).to_f/1000
		in_km(avg_dist)
	end

	def avg_price_in_eur(rides)
		return in_euro(0) if rides.count == 0
		avg_price = (rides.map { |ride| ride.price }.sum/(rides.count))
		in_euro(avg_price)
	end

	def display_taxis(rides)
		rides.map {|ride| ride.taxi.name}.join(", ")
	end

	def total_price(rides)
		price = rides.map {|ride| ride.price}.sum
		in_euro(price)
	end

	private

	def in_km(distance)
		"#{distance.round(3)}km"
	end

	def in_euro(price)
		"#{price.round(2)} EUR"
	end
end