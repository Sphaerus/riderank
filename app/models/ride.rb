class Ride < ActiveRecord::Base
  belongs_to :user
  has_one :destination_address, class_name: "Address"
  has_one :start_address, class_name: "Address"

  validates :user_id, :price, presence: true
  accepts_nested_attributes_for :start_address, :destination_address
end
