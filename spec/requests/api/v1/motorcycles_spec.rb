require 'rails_helper'

RSpec.describe 'Api::V1::Motorcycles', type: :request do
  describe 'User motorcycle, ' do
    before(:each) do
      @user = FactoryBot.build(:user)
      @motorcycle = FactoryBot.create(:motorcycle, user: @user)
      post '/api/v1/motorcycle',
           params: { title: @motorcycle.title, model: @motorcycle.model, description: @motorcycle.description,
                     cylinder: @motorcycle.cylinder, acceleration: @motorcycle.acceleration, images: @motorcycle.images,
                     price: @motorcycle.price, discount: @motorcycle.discount, duration: @motorcycle.duration }
      expect(response).to have_http_status(:ok)
    end
  end
end
