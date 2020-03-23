require 'rails_helper'

RSpec.describe Vote, type: :model do
  let(:user) { User.create(id: 2, username: "username", email: "sample@example.com", password: "password") }
  let(:post) { Post.create(id: 1, user_id: user.id, points: 1, tag_id: nil, title: "newTitle", body: "newBody") }
  let(:comment) { Comment.create(id: 1, user_id: user.id, points: 1, post_id: post.id, body: 'MyBody', ancestry: nil) }
  let(:vote_post) { Vote.new(value: 1, user_id: user.id, post_id: post.id, comment_id: nil) }
  let(:vote_comment) { Vote.new(value: 1, user_id: user.id, post_id: nil, comment_id: comment.id) }

  it 'post is valid' do
    expect(vote_post).to be_valid
  end

  it 'comment is valid' do
    expect(vote_comment).to be_valid
  end
end
