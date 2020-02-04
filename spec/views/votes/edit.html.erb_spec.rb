require 'rails_helper'

RSpec.describe "votes/edit", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :type => "",
      :user_id => 1,
      :post_id => 1,
      :comment_id => 1
    ))
  end

  it "renders the edit vote form" do
    render

    assert_select "form[action=?][method=?]", vote_path(@vote), "post" do

      assert_select "input[name=?]", "vote[type]"

      assert_select "input[name=?]", "vote[user_id]"

      assert_select "input[name=?]", "vote[post_id]"

      assert_select "input[name=?]", "vote[comment_id]"
    end
  end
end
