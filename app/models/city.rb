class City < ApplicationRecord
  belongs_to :country
  has_many :airports

  validates :name, presence: true, uniqueness: true
end
