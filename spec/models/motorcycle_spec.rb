require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  before(:each) do
    @motorcycle = Motorcycle.create(:motorcycle)
  end

  context 'Motorcycle model, ' do
    it 'should have valid attributes' do
      expect(@motorcycle).to be_valid
    end
  end
end
