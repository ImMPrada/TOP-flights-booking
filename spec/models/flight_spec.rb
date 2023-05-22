require 'rails_helper'

RSpec.describe Flight, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:departure_date) }
    it { should validate_presence_of(:arrival_date) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:airplane) }
    it { should belong_to(:departure_airport).class_name('Airport') }
    it { should belong_to(:arrival_airport).class_name('Airport') }
    it { should have_many(:itinerary_flights) }
    it { should have_many(:itineraries).through(:itinerary_flights) }
  end
end
