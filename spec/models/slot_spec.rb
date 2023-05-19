require 'rails_helper'

RSpec.describe Slot, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:available) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:airplane) }

    describe 'a slot named E1 can exist in two ariplanes' do
      let(:slot_e1_airplane2) { build(:slot, name: 'E1', airplane: create(:airplane)) }

      before { create(:slot, name: 'E1', airplane: create(:airplane)) }

      it 'should be valid' do
        expect(slot_e1_airplane2).to be_valid
      end
    end

    describe "a slot named E1 can't exist in the same ariplane" do
      let(:existing_airplane) { create(:airplane, model: 'AIRBUS502') }
      let(:slot_e1_airplane2) { build(:slot, name: 'E1', airplane: existing_airplane) }

      before { create(:slot, name: 'E1', airplane: existing_airplane) }

      it 'should be invalid' do
        expect(slot_e1_airplane2).to be_invalid
      end
    end
  end
end
