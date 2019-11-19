require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(username: "username", email: "sample@example.com", password: "password") }

  it 'is valid' do
    expect(user).to be_valid
  end
end
