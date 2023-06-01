require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:number) }
  end

  describe 'associations' do
    it { should have_many(:booking_flights) }
    it { should have_many(:flights).through(:booking_flights) }
    it { should have_one(:invoice) }
    it { should belong_to(:user) }
  end
end
