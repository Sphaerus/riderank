class Ride < ActiveRecord::Base
  belongs_to :user
  has_one :destination_address, class_name: "Address"
  has_one :start_address, class_name: "Address"
  belongs_to :taxi

  validates :user_id, :price, :distance, :taxi_id, presence: true
  accepts_nested_attributes_for :start_address, :destination_address

  before_validation :set_distance

  def self.current_week
  	beginning_of_week = Date.today.at_beginning_of_week
  	self.where("created_at > ?", beginning_of_week)
  end

  def self.current_month
  	beginning_of_month = Date.today.at_beginning_of_month
  	self.where("created_at > ?", beginning_of_month)
  end

  private

  def set_distance
  	@calculator = DistanceCalculator.new(self.start_address, self.destination_address)
  	distance_in_meters = @calculator.get_distance_metric
  	if distance_in_meters.is_a?(Integer)
  		self.distance = distance_in_meters
  	else
  		errors.add(:distance, distance_in_meters)
  	end
  end
end
