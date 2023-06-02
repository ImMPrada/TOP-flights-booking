require 'rails_helper'

RSpec.describe Booking, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:number) }
  end

  describe 'associations' do
    it { should have_one(:invoice) }
    it { should belong_to(:flight) }
    it { should belong_to(:user) }
  end

  describe 'nested attributes' do
    it { should accept_nested_attributes_for(:flight) }
    it { should accept_nested_attributes_for(:passengers) }
  end
end
