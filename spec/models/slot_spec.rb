require 'rails_helper'

RSpec.describe Slot, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:available) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:airplane) }
  end
end
