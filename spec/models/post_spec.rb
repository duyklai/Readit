require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(user_id: 1, points: 1, tag: 'general', title: 'MyTitle', body: 'MyBody')}

  it 'is valid' do
    expect(post).to be_valid
  end

  it 'is invalid without title or body' do
    post.title = nil
    post.body = nil
    expect(post).to_not be_valid
  end
end
