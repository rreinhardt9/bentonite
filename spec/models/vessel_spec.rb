require 'rails_helper'

RSpec.describe Vessel, :type => :model do

  it 'has a valid factory' do
    expect(create(:vessel)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:vessel, name: nil)).to_not be_valid
  end

  it 'is invalid with duplicate names' do
    create(:vessel, name: '1000-5')
    expect(build(:vessel, name: '1000-5')).to_not be_valid
  end
end
