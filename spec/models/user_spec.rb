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

    it 'should have valid password' do
      @user.password = 'root123'
      expect(@user).to be_valid
    end

    it 'should throw an error if password is too long (maximum of 20 characters)' do
      @user.password = 'password password password password password password'
      expect(@user).to_not be_valid
    end

    it 'should throw an error if password is too short (minimum of 4 characters)' do
      @user.password = 'key'
      expect(@user).to_not be_valid
    end
  end
end
