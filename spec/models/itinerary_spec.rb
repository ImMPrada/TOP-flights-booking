require 'rails_helper'

RSpec.describe Itinerary, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:number) }
  end

  describe 'associations' do
    it { should have_many(:itinerary_flights) }
    it { should have_many(:flights).through(:itinerary_flights) }
    it { should have_one(:invoice) }
  end
end
