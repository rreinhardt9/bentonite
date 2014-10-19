require 'rails_helper'

RSpec.describe Winery, type: :model do

  it 'has a valid factory' do
    expect(create(:winery)).to be_valid
  end

  it 'is invalid without a name' do
    expect(build(:winery, name: nil)).to_not be_valid
  end

  it 'is invalid with duplicate names' do
    create(:winery, name: 'grapes r us')
    expect(build(:winery, name: 'grapes r us')).to_not be_valid
  end
end
