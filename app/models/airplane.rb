class Airplane < ApplicationRecord
  has_many :slots, dependent: :destroy
  has_many :flights

  validates :model, presence: true
end
