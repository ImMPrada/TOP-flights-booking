require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_one(:passenger) }
    it { should have_many(:invoices) }
    it { should have_many(:itineraries).through(:invoices) }
  end
end
