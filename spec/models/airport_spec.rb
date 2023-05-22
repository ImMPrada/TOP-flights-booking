require 'rails_helper'

RSpec.describe Airport, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:city) }
    it { should have_many(:departure_flights).with_foreign_key(:departure_airport_id).class_name('Flight') }
    it { should have_many(:arrival_flights).with_foreign_key(:arrival_airport_id).class_name('Flight') }
  end
end
