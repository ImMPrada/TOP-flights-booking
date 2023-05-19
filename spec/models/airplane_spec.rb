require 'rails_helper'

RSpec.describe Airplane, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:model) }
  end

  describe 'associations' do
    it { should have_many(:seats) }
  end
end
