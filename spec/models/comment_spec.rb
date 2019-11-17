require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:post) { Post.create(user_id: 1, points: 1, tag: 'general', title: 'MyTitle', body: 'MyBody') }
  let(:comment) { Comment.new(user_id: 1, points: 1, post_id: post.id, body: 'MyBody') }

  it 'is valid' do
    expect(comment).to be_valid
  end

  it 'is invalid without body' do
    comment.body = nil
    expect(comment).to_not be_valid
  end
end
