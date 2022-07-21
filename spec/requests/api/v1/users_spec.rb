require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'Login post api,  ' do
    it 'creates a new user' do
      @user = FactoryBot.build(:user)
      post '/api/v1/login',
           params: { username: @user.username, email: @user.email, photo: @user.photo }
      expect(response).to have_http_status(:ok)
    end

    it 'should return all users' do
      @user = FactoryBot.create(:user)
      get '/api/v1/users'
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /api/v1/user/:id' do
    before(:each) do
      @user = FactoryBot.create(:user)
      get '/api/v1/user/1'
    end

    it 'should throw an unauthorized error' do
      get '/api/v1/user/1'
      expect(response).to have_http_status(:unauthorized)
    end
  end
end
