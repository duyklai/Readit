require 'rails_helper'

RSpec.describe "Comments", type: :request do
  describe "GET /comments" do
    let(:post) { Post.create(user_id: 1, points: 1, tag_id: 1, title: "newTitle", body: "newBody") }
    it "works! (now write some real specs)" do
      get post_path(post)
      expect(response).to have_http_status(200)
    end
  end
end
