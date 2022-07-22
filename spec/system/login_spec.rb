require 'rails_helper'

RSpec.describe 'Login Page', type: :system do
  before :example do
    driven_by(:rack_test)
    @user = FactoryBot.create(:user)

    post '/api/v1/login'
  end

  context 'Login, ' do
    it 'should redirect to home page' do
      @user.email = 'you@gmail.com'
      @user.photo = '12345.png'
      @user.username = 'Tony'

      expect(page).to have_current_path('/')
    end

    it 'should throw an error if incorrect login details' do
      @user.email = 'you@gmail.com'
      @user.photo = ''
      @user.username = 'Tony'

      expect(@user).to_not be_valid
    end
  end
end
