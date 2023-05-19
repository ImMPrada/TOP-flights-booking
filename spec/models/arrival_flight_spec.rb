require 'rails_helper'

RSpec.describe ArrivalFlight, type: :model do
  describe 'associations' do
    it { should belong_to(:airport) }
    it { should belong_to(:flight) }
  end
end
