require 'rails_helper'

RSpec.describe "posts/edit", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(
      :user_id => 1,
      :points => 1,
      :tag => "MyString"
    ))
  end

  it "renders the edit post form" do
    render

    assert_select "form[action=?][method=?]", post_path(@post), "post" do

      assert_select "input[name=?]", "post[user_id]"

      assert_select "input[name=?]", "post[points]"

      assert_select "input[name=?]", "post[tag]"
    end
  end
end
