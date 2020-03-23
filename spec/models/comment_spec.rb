require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { User.create(:id => 2, :username => "newuser", :email => "sample@example.com", :password => "password") }
  let(:tag) { Tag.create(:id => 1, :name => "newtag") }
  let(:post) { Post.create(id: 1, user_id: user.id, points: 1, tag_id: tag.id, title: 'MyTitle', body: 'MyBody') }
  let(:comment) { Comment.new(id: 1, user_id: user.id, points: 1, post_id: post.id, body: 'MyBody', ancestry: nil) }

  it 'is valid' do
    expect(comment).to be_valid
  end

  it 'is invalid without body' do
    comment.body = nil
    expect(comment).to_not be_valid
  end

  describe 'hard-coded ancestry testing' do
    let(:child_comment) { Comment.new(id: 2, user_id: user.id, points: 1, post_id: post.id, body: 'MyBody', ancestry: 1) }

    it 'can have ancestry nil as parent comment' do
      comment.ancestry = nil
      expect(comment).to be_valid
    end
    
    it 'can have child comment' do
      expect(child_comment).to be_valid
    end
  end
end
