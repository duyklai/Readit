require 'rails_helper'

RSpec.describe "votes/show", type: :view do
  before(:each) do
    @vote = assign(:vote, Vote.create!(
      :type => "Type",
      :user_id => 2,
      :post_id => 3,
      :comment_id => 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Type/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/4/)
  end
end
