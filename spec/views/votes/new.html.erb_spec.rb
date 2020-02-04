require 'rails_helper'

RSpec.describe "votes/new", type: :view do
  before(:each) do
    assign(:vote, Vote.new(
      :type => "",
      :user_id => 1,
      :post_id => 1,
      :comment_id => 1
    ))
  end

  it "renders new vote form" do
    render

    assert_select "form[action=?][method=?]", votes_path, "post" do

      assert_select "input[name=?]", "vote[type]"

      assert_select "input[name=?]", "vote[user_id]"

      assert_select "input[name=?]", "vote[post_id]"

      assert_select "input[name=?]", "vote[comment_id]"
    end
  end
end
