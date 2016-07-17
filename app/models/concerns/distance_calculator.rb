require "net/http"
require "uri"

class DistanceCalculator
	def initialize(start_address, destination_address)
		@start_address = start_address
		@destination_address = destination_address
	end

	def get_distance_metric
		units = "metric"
		get_distance(units)
	end

	private

	def get_distance(units)
		uri = URI google_api_url
		add_param_to_link(uri, "units", units)
		add_param_to_link(uri, "origins", @start_address.address)
		add_param_to_link(uri, "destinations", @destination_address.address)
		add_param_to_link(uri, "key", api_key)

		api_response = get_api_response(uri)
		if api_response["rows"].first["elements"].first["status"] == "OK"
			return api_response["rows"].first["elements"].first["distance"]["value"]
		else
			return api_response["rows"].first["elements"].first["status"]
		end	
	end

	def get_api_response(uri)
		http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
		response = http.request(Net::HTTP::Get.new(uri.request_uri))
		JSON response.body
	end

	def google_api_url
		"https://maps.googleapis.com/maps/api/distancematrix/json"
	end

	def api_key
		Rails.application.secrets.google_api_key
	end

	def add_param_to_link(uri, key, value)
		new_query = URI.decode_www_form(uri.query || '') << [key, value]
		uri.query = URI.encode_www_form(new_query)
	end
end