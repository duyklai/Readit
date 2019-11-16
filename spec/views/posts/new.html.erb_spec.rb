require 'rails_helper'

RSpec.describe "posts/new", type: :view do
  before(:each) do
    assign(:post, Post.new(
      :user_id => 1,
      :points => 1,
      :tag => "MyString"
    ))
  end

  it "renders new post form" do
    render

    assert_select "form[action=?][method=?]", posts_path, "post" do

      assert_select "input[name=?]", "post[user_id]"

      assert_select "input[name=?]", "post[points]"

      assert_select "input[name=?]", "post[tag]"
    end
  end
end
