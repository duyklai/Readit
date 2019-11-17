require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :user_id => 1,
      :posts_id => 1,
      :points => 1,
      :body => "MyString"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[posts_id]"

      assert_select "input[name=?]", "comment[points]"

      assert_select "input[name=?]", "comment[body]"
    end
  end
end
