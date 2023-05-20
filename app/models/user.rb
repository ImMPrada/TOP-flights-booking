class User < ApplicationRecord
  has_one :passenger
  has_many :itineraries
  has_many :invoices, through: :itineraries
  has_many :flights, through: :itineraries

  validates :email, presence: true, uniqueness: true
end
