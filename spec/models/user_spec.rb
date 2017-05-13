require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = FactoryGirl.create(:user)
  end

  it 'valid example with Factories' do
    expect(@user).to be_valid
  end

  it 'has correct attributes' do
    expect(@user).to respond_to(:full_name)
  end

  it 'respond to: scope adults' do
    expect(User).to respond_to(:adults)
  end

  it 'must be in scope' do
    expect(User.adults).to include(@user)
  end

  it 'should require a email' do
    expect(FactoryGirl.build(:user, email: '')).to_not be_valid
  end

  it 'should require a password' do
    expect(FactoryGirl.build(:user, password: '')).to_not be_valid
  end

  it 'password less than 8 sym' do
    expect(FactoryGirl.build(:user, password: '123456')).to_not be_valid
  end

end
