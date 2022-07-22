require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
  end

  context 'User model, ' do
    it 'should have valid attributes' do
      expect(@user).to be_valid
    end

    it 'should have valid name attributes' do
      @user.username = 'My name'
      expect(@user).to be_valid
    end

    it 'should throw an error if name attribute is not given' do
      @user.username = ''
      expect(@user).to_not be_valid
    end

    it 'should have valid photo attributes' do
      @user.photo = '12345.png'
      expect(@user).to be_valid
    end

    it 'should throw an error if photo attribute is not given' do
      @user.photo = ''
      expect(@user).to_not be_valid
    end

    it 'should have valid email attributes' do
      @user.email = 'you@gmail.com'
      expect(@user).to be_valid
    end

    it 'should throw an error if email attribute is not given' do
      @user.email = ''
      expect(@user).to_not be_valid
    end
  end
end
