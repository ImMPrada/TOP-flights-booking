require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:pin) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should belong_to(:user).optional }
    it { should have_many(:itinerary_passengers) }
    it { should have_many(:itineraries).through(:itinerary_passengers) }
  end

  describe 'when passenger is a user' do
    let(:passenger) { create(:passenger, :is_user) }

    it 'should have a user' do
      expect(passenger.user).to be_a(User)
    end
  end
end
