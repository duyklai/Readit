require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:vote_post) { Vote.new(value: 1, user_id: 1, post_id: 1, comment_id: nil) }
  let(:vote_comment) { Vote.new(value: 1, user_id: 1, post_id: nil, comment_id: 1) }

  it 'post is valid' do
    expect(vote_post).to be_valid
  end

  it 'comment is valid' do
    expect(vote_comment).to be_valid
  end
end
