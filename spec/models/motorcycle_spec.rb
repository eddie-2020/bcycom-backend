require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Motorcycle, type: :model do
  before(:each) do
    @user = FactoryBot.create(:user)
    @motorcycle = FactoryBot.create(:motorcycle, user: @user)
  end

  context 'Motorcycle model, ' do
    it 'should have valid attributes' do
      expect(@motorcycle).to be_valid
    end

    it 'should not be valid without title attribute' do
      @motorcycle.title = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without model attribute' do
      @motorcycle.model = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without description attribute' do
      @motorcycle.description = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without cylinder attribute' do
      @motorcycle.cylinder = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without acceleration attribute' do
      @motorcycle.acceleration = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without price attribute' do
      @motorcycle.price = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without image attribute' do
      @motorcycle.images = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should not be valid without duration attribute' do
      @motorcycle.duration = ''
      expect(@motorcycle).to_not be_valid
    end

    it 'should be valid with title attribute' do
      @motorcycle.title = 'Sozuki'
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with description attribute' do
      @motorcycle.description = 'This has a very strong horse power with high speed at low distance'
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with model attribute' do
      @motorcycle.model = 'Sozuki Z10'
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with cylinder attribute' do
      @motorcycle.cylinder = 2
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with acceleration attribute' do
      @motorcycle.acceleration = '200m/s'
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with price attribute' do
      @motorcycle.price = 3500
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with images attribute' do
      @motorcycle.images = 'url1', 'url2'
      expect(@motorcycle).to be_valid
    end

    it 'should be valid with discount attribute' do
      @motorcycle.discount = 50
      expect(@motorcycle).to be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength
