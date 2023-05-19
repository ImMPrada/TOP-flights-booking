require 'rails_helper'

RSpec.describe ItineraryPassenger, type: :model do
  describe 'associations' do
    it { should belong_to(:itinerary) }
    it { should belong_to(:passenger) }
  end
end
