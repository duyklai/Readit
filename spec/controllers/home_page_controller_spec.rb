require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  describe "GET #home" do
    it "returns a success response" do
      get :home, params: {}
      expect(response).to be_successful
    end
  end
end
