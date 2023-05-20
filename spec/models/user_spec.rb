require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_one(:passenger) }
    it { should have_many(:itineraries) }
    it { should have_many(:invoices).through(:itineraries) }
    it { should have_many(:flights).through(:itineraries) }
  end
end
