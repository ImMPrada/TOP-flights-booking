class Passenger < ApplicationRecord
  belongs_to :user, optional: true
  has_many :booking_passengers
  has_many :bookings, through: :booking_passengers

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :identification_number, presence: true, uniqueness: { case_sensitive: false }
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
