require 'rails_helper'

RSpec.describe Invoice, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:total_amount) }
    it { should validate_presence_of(:paid) }
  end

  describe 'associations' do
    it { should belong_to(:itinerary) }
    it { should belong_to(:user) }
  end
end
