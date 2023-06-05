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
          first_name: passenger.first_name,
          last_name: passenger.last_name,
          identification_number: passenger.identification_number,
          email: passenger.email
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

  describe '#add_passengers_to_booking' do
    before { booking_creator.build }

    describe 'when user passenger information is invalid' do
      let(:booking_build_params) do
        {
          passengers_attributes: {
            '0': {
              first_name: '',
              last_name: passenger.last_name,
              identification_number: passenger.identification_number,
              email: passenger.email
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

      it 'raises error' do
        expect { booking_creator.add_passengers_to_booking }.to raise_error(StandardError)
      end
    end

    describe 'when passengers information is invalid' do
      let(:booking_build_params) do
        {
          passengers_attributes: {
            '0': {
              first_name: passenger.first_name,
              last_name: passenger.last_name,
              identification_number: passenger.identification_number,
              email: passenger.email
            },
            '1': {
              first_name: Faker::Name.first_name,
              last_name: Faker::Name.last_name,
              identification_number: '',
              email: Faker::Internet.email
            }
          }
        }
      end

      it 'raises error' do
        expect { booking_creator.add_passengers_to_booking }.to raise_error(StandardError)
      end
    end

    describe 'when passengers information is valid' do
      it 'returns the booking passengers' do
        expect(booking_creator.add_passengers_to_booking).to be_a(ActiveRecord::Associations::CollectionProxy)
      end
    end
  end

  describe '#commit' do
    describe 'when flight is nil' do
      let(:flight) { nil }

      it 'raises error' do
        expect { booking_creator.commit }.to raise_error(StandardError)
      end
    end

    describe 'when user is nil' do
      let(:user) { nil }

      it 'raises error' do
        expect { booking_creator.commit }.to raise_error(StandardError)
      end
    end

    describe 'when no passenger added' do
      it 'raises error' do
        expect { booking_creator.commit }.to raise_error(StandardError)
      end
    end

    describe 'when everything is ok' do
      before do
        booking_creator.build
        booking_creator.add_passengers_to_booking
      end

      it 'returns the booking' do
        expect(booking_creator.commit).to be_a(Booking)
      end
    end
  end
end
