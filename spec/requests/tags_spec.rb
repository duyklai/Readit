require 'rails_helper'

RSpec.describe "Tags", type: :request do
  describe "GET /tags" do
    let(:tag) { Tag.create(:name => "newtag") }
    it "works! (now write some real specs)" do
      get tag_path(tag)
      expect(response).to have_http_status(200)
    end
  end
end
