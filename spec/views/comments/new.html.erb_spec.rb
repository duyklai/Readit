require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  let(:post) { Post.create( :user_id => 1, :points => 1, :tag => "MyString", :title => "MyTitle", :body => "MyBody") }
  let(:comment) { Comment.new(:user_id => 2, :post_id => post.id, :points => 1, :body => "MyString") }
  before(:each) do
    assign(:comment, comment)
  end

  xit "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[points]"

      assert_select "input[name=?]", "comment[body]"
    end
  end
end
