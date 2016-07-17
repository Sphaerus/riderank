class Address < ActiveRecord::Base
  belongs_to :ride
  validates :street, :city, :country, presence: true
end
