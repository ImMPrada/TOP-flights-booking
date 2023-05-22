class Invoice < ApplicationRecord
  belongs_to :itinerary

  validates :total_amount, presence: true
  validates :paid, inclusion: { in: %w[true false] }, presence: true
end
