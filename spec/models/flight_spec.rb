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
    it { should have_many(:booking_flights) }
    it { should have_many(:bookings).through(:booking_flights) }
    it { should belong_to(:departure_city).class_name('City') }
    it { should belong_to(:arrival_city).class_name('City') }
  end

  describe 'scopes' do
    let(:today) { Date.today }
    let(:country) { create(:country, name: 'Colombia', symbol: 'CO') }
    let(:departure_city) { create(:city, name: 'from', country:) }
    let(:arrival_city) { create(:city, name: 'to', country:) }

    before do
      create(:flight, departure_date: today, arrival_date: today + 1.day, departure_city:, arrival_city:)
      create(:flight, departure_date: today + 1.day, arrival_date: today + 2.days, departure_city:, arrival_city:)
      create(:flight, departure_date: today + 2.days, arrival_date: today + 3.days, departure_city:, arrival_city:)
    end

    describe '.availables' do
      it 'should return all available flights' do
        expect(Flight.available.count).to eq(2)
      end
    end

    describe '.by_departure_since_date' do
      it 'should return all flights by departure since date' do
        expect(Flight.by_departure_date(today).count).to eq(1)
      end
    end

    describe '.by_departure_city' do
      it 'should return all flights by departure city' do
        expect(Flight.by_departure_city(departure_city.id).count).to eq(3)
      end
    end

    describe '.by_arrival_city' do
      it 'should return all flights by arrival city' do
        expect(Flight.by_arrival_city(arrival_city.id).count).to eq(3)
      end
    end
  end
end
