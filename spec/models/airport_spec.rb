require 'rails_helper'

RSpec.describe Airport, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:city) }
    it { should have_many(:departure_flights).dependent(:destroy) }
    it { should have_many(:departures).through(:departure_flights).source(:flight) }
    it { should have_many(:arrival_flights).dependent(:destroy) }
    it { should have_many(:arrivals).through(:arrival_flights).source(:flight) }
  end
end
