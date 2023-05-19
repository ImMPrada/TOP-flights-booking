class Airplane < ApplicationRecord
  has_many :seats, dependent: :destroy
  has_many :flights

  validates :model, presence: true
end
