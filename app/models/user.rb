class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :passenger
  has_many :itineraries
  has_many :invoices, through: :itineraries
  has_many :flights, through: :itineraries

  validates :email, presence: true, uniqueness: true
end
