require 'rails_helper'

RSpec.describe BookingPassenger, type: :model do
  describe 'associations' do
    it { should belong_to(:booking) }
    it { should belong_to(:passenger) }
  end
end
