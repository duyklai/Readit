require 'rails_helper'

RSpec.describe User, type: :model do
  # Run once to save in database: User.create!(username: "firstuser", email: "firstuser@example.com", password: "password")
  let(:user) { User.new(username: "username", email: "sample@example.com", password: "password") }

  it 'is valid' do
    expect(user).to be_valid
  end

  it 'is invalid without a username' do
    user.username = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without an email' do
    user.email = nil
    expect(user).to_not be_valid
  end

  it 'is invalid without a password' do
    user.password = nil
    expect(user).to_not be_valid
  end

  describe 'uniqueness test / need to create another user' do
    it 'is invalid without unique username' do
      user.username = "firstuser"
      expect(user).to_not be_valid
    end

    it 'is invalid without unique email' do
      user.email = "firstuser@example.com"
      expect(user).to_not be_valid
    end
  end
end
