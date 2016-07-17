class Address < ActiveRecord::Base
  belongs_to :ride
  validates :address, presence: true
end
