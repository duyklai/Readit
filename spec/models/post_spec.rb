require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { Post.new(user_id: 1, points: 1, tag_id: 1, title: "newTitle", body: "newBody") }

  it 'is valid' do
    expect(post).to be_valid
  end

  it 'is valid without body' do
    post.body = nil
    expect(post).to be_valid
  end

  it 'is invalid without title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'is valid without a tag' do
    post.tag_id = nil
    expect(post).to be_valid
  end

  it 'is invalid without a user' do
    post.user_id = nil
    expect(post).to_not be_valid
  end
end
