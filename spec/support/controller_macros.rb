module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      user = FactoryBot.create(:user)
      sign_in user
    end
  end

  FactoryBot.define do
    factory :user do
      username { "username" }
      email { Faker::Internet.email }
      password { "password"} 
      password_confirmation { "password" }
    end
  end

end