require 'rails_helper'

RSpec.describe Reservation, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @motorcycle = FactoryBot.create(:motorcycle, user: @user)
    @reservation = FactoryBot.create(:reservation, user: @user, motorcycle: @motorcycle)
  end

  context 'Reservation model, ' do
    it 'should not create reservation if invalid user id' do
      @reservation.user = nil
      expect(@reservation).to_not be_valid
    end

    it 'should not create reservation if invalid motorcycle id' do
      @reservation.motorcycle = nil
      expect(@reservation).to_not be_valid
    end
  end
end
