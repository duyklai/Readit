require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user_first = User.create(username: "firstuser", email: "firstuser@example.com", password: "password") 
    @user = User.new(username: "username", email: "sample@example.com", password: "password") 
  end

  it 'is valid' do
    expect(@user).to be_valid
  end

  it 'is invalid without a username' do
    @user.username = nil
    expect(@user).to_not be_valid
  end

  it 'is invalid without an email' do
    @user.email = nil
    expect(@user).to_not be_valid
  end

  it 'is invalid without a password' do
    @user.password = nil
    expect(@user).to_not be_valid
  end

  describe 'uniqueness test' do
    it 'is invalid without unique username' do
      @user.username = "firstuser"
      expect(@user).to_not be_valid
    end

    it 'is invalid without unique email' do
      @user.email = "firstuser@example.com"
      expect(@user).to_not be_valid
    end
  end
end
