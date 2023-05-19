class PassengerFlight < ApplicationRecord
  belongs_to :user
  belongs_to :flight
  belongs_to :passenger
end
