require 'rails_helper'

RSpec.describe Country, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:symbol) }
  end

  describe 'associations' do
    it { should have_many(:cities) }
  end
end
