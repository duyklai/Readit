require 'rails_helper'

RSpec.describe "votes/index", type: :view do
  before(:each) do
    assign(:votes, [
      Vote.create!(
        :type => "Type",
        :user_id => 2,
        :post_id => 3,
        :comment_id => 4
      ),
      Vote.create!(
        :type => "Type",
        :user_id => 2,
        :post_id => 3,
        :comment_id => 4
      )
    ])
  end

  it "renders a list of votes" do
    render
    assert_select "tr>td", :text => "Type".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
