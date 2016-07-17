module ApplicationHelper
	def taxi_collection
		Taxi.all.map {|taxi| [taxi.name, taxi.id]}
	end
end
