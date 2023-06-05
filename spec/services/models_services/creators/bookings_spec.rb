require 'rails_helper'
require 'byebug'

RSpec.describe ModelsServices::Creators::Bookings do
  subject(:booking_creator) { described_class.new(flight:, user:, booking_build_params:) }

  let(:flight) { create(:flight) }
  let(:passenger) { create(:passenger, :is_user) }
  let(:user) { passenger.user }
  let(:booking_build_params) do
    {
      passengers_attributes: {
        '0': {
          id: '1',
          first_name: 'eugeniolo',
          last_name: 'prada',
          identification_number: '1090416331',
          email: 'miguel@mail.com'
        },
        '1': {
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          identification_number: Faker::Number.number.to_s,
          email: Faker::Internet.email
        }
      }
    }
  end

  describe '#build' do
    describe 'when flight is nil' do
      let(:flight) { nil }

      it 'raises error' do
        expect { booking_creator.build }.to raise_error(StandardError)
      end
    end

    describe 'when user is nil' do
      let(:user) { nil }

      it 'raises error' do
        expect { booking_creator.build }.to raise_error(StandardError)
      end
    end

    describe 'when passenger information is invalid' do
      let(:booking_build_params) do
        {
          passengers_attributes: {
            '0': {
              id: '1',
              first_name: 'eugeniolo',
              last_name: 'prada',
              identification_number: '1090416331',
              email: 'miguel@mail.com'
            },
            '1': {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              identification_number: Faker::Number.number.to_s,
              email: ''
            }
          }
        }
      end

      it "doesn't raise error" do
        expect { booking_creator.build }.not_to raise_error(StandardError)
      end
    end

    describe 'when there are flight and user' do
      it 'returns a booking' do
        expect(booking_creator.build).to be_a(Booking)
      end
    end
  end
end


