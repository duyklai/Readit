require 'rails_helper'

RSpec.describe HomePageController, type: :controller do
  describe "home page" do
    it 'gets home url' do
        get home_page_home_url
        assert_response :success
    end
  end
end
