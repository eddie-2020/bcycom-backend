require 'rails_helper'

RSpec.describe 'Api::V1::Reservations', type: :request do
  describe 'User motorcycle, ' do
    before(:each) do
      @user = FactoryBot.build(:user)
      @motorcycle = FactoryBot.create(:motorcycle, user: @user)
      @reservation = FactoryBot.create(:reservation, user: @user, motorcycle: @motorcycle)
      post '/api/v1/reservation',
           params: { phone: @reservation.phone, user: @user, motorcycle_id: @reservation.motorcycle_id }
      expect(response).to have_http_status(:ok)
    end
  end
end
