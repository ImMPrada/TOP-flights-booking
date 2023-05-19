class Invoice < ApplicationRecord
  belongs_to :itinerary
  belongs_to :user

  validates :total_amount, presence: true
  validates :paid, inclusion: { in: %w[true false] }, presence: true
end
