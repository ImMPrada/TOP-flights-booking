class Invoice < ApplicationRecord
  belongs_to :booking

  validates :total_amount, presence: true
  validates :paid, inclusion: { in: %w[true false] }, presence: true
end
