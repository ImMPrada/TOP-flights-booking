require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:passenger_flights) }
    it { should have_many(:flights).through(:passenger_flights) }
    it { should have_one(:passenger) }
  end
end
