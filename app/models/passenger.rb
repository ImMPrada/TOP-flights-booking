class Passenger < ApplicationRecord
  belongs_to :user
  has_many :passenger_flights, dependent: :destroy
  has_many :flights, through: :passenger_flights

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :pin, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
