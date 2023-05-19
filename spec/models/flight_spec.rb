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
    it { should have_many(:itinerary_flights) }
    it { should have_many(:itineraries).through(:itinerary_flights) }
    it { should have_many(:deaperture_flights) }
    it { should have_many(:deaperture_airports).through(:deaperture_flights).source(:airport) }
    it { should have_many(:arrival_flights) }
    it { should have_many(:arrival_airports).through(:arrival_flights).source(:airport) }
  end
end
