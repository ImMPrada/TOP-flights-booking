require 'rails_helper'

RSpec.describe City, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:country) }
    it { should have_many(:airports) }
  end

  describe '.all_cities_with_country_symbol' do
    before { create(:city, country: create(:country, symbol: 'BR')) }

    it 'should return all cities with country symbol' do
      expect(City.all_cities_with_country_symbol.first.country_symbol).to eq('BR')
    end
  end
end
