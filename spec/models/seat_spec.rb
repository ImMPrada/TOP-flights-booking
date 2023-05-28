require 'rails_helper'

RSpec.describe Seat, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:available) }
    it { should validate_presence_of(:price) }
  end

  describe 'associations' do
    it { should belong_to(:airplane) }

    describe 'a seat named E1 can exist in two ariplanes' do
      let(:seat_e1_airplane2) { build(:seat, name: 'E1', airplane: create(:airplane)) }

      before { create(:seat, name: 'E1', airplane: create(:airplane)) }

      it 'should be valid' do
        expect(seat_e1_airplane2).to be_valid
      end
    end

    describe "a seat named E1 can't exist in the same ariplane" do
      let(:existing_airplane) { create(:airplane, model: 'AIRBUS502') }
      let(:seat_e1_airplane2) { build(:seat, name: 'E1', airplane: existing_airplane) }

      before { create(:seat, name: 'E1', airplane: existing_airplane) }

      it 'should be invalid' do
        expect(seat_e1_airplane2).to be_invalid
      end
    end
  end

  describe 'scopes' do
    describe '.availables' do
      let(:available_seat) { create(:seat, available: true) }
      let(:unavailable_seat) { create(:seat, available: false) }

      it 'should return only available seats' do
        expect(Seat.availables).to eq([available_seat])
      end
    end
  end
end
