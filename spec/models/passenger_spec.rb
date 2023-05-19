require 'rails_helper'

RSpec.describe Passenger, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:pin) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:passenger_flights) }
    it { should have_many(:flights).through(:passenger_flights) }
  end
end
