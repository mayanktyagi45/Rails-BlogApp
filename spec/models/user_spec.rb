require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.build(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is invalid without an email' do
      user.email = nil
      expect(user).to be_invalid
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without a password' do
      user.password = nil
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid with a duplicate email' do
      user.save
      duplicate_user = FactoryBot.build(:user, email: user.email)
      expect(duplicate_user).to be_invalid
      expect(duplicate_user.errors[:email]).to include("has already been taken")
    end

    it 'is invalid if the password is too short' do
      user.password = 'short'
      expect(user).to be_invalid
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it 'is invalid if the password confirmation does not match' do
      user.password_confirmation = 'different_password'
      expect(user).to be_invalid
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end
  end

  describe 'Devise functionality' do
    it 'allows the user to authenticate with valid credentials' do
      user.save
      expect(User.find_for_database_authentication(email: user.email).valid_password?(user.password)).to be_truthy
    end
  end
end
