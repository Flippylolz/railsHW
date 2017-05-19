require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    let!(:user_1) { build(:user, email: '') }
    let!(:user_2) { build(:user, password: '') }
    let!(:user_3) { build(:user, password: '123456') }

    it 'should require a email' do
      expect(user_1).to_not be_valid
    end

    it 'should require a password' do
      expect(user_2).to_not be_valid
    end

    it 'password less than 8 sym' do
      expect(user_3).to_not be_valid
    end
  end

  describe 'Correct User' do
    let!(:user) { create(:user) }

    it 'valid example with Factories' do
      expect(user).to be_valid
    end
  end

  describe 'scopes' do
    let!(:user) { create(:user) }

    it 'respond to: scope adults' do
      expect(User).to respond_to(:adults)
    end

    it 'must be in scope' do
      expect(User.adults).to include(user)
    end
  end

  describe '#fullname' do
    subject { create(:user, first_name: 'John', last_name: 'Doe') }

    it { is_expected.to be_instance_of(User) }

    it 'should return full name' do
      expect(subject.full_name).to eq 'John Doe'
    end
  end
end
# == Schema Information
#
# Table name: users
#
#  id            :integer         not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  username      :string(255)
#  email         :string(255)
#  birthday      :datetime
#  created_at    :datetime        not null
#  updated_at    :datetime        not null
#  password_hash :string(255)
#  password_salt :string(255)
#
