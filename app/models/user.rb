class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :passenger
  has_many :bookings
  has_many :invoices, through: :bookings
  has_many :flights, through: :bookings

  validates :email, presence: true, uniqueness: true
end
