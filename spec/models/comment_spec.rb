require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:comment) { Comment.new(user_id: 1, points: 1, post_id: 1, body: 'MyBody', ancestry: nil) }

  it 'is valid' do
    expect(comment).to be_valid
  end

  it 'is invalid without body' do
    comment.body = nil
    expect(comment).to_not be_valid
  end
  
  it "responds with its points after they're created" do
    expect(comment.points).to eq(1)
  end

  it "responds with its body after they're created" do
    expect(comment.body).to eq('MyBody')
  end

  it "responds with its user id after they're created" do
    comment.user_id = 3
    expect(comment.user_id).to eq(3)
  end

  it "responds with its post id after they're created" do
    expect(comment.post_id).to eq(1)
  end

  describe 'hard-coded ancestry testing' do
    let(:child_comment) { Comment.new(user_id: 1, points: 1, post_id: 1, body: 'MyBody', ancestry: 1) }

    it 'can have ancestry nil as parent comment' do
      comment.ancestry = nil
      expect(comment).to be_valid
    end
    
    it 'can have child comment' do
      expect(child_comment).to be_valid
    end
  end
end
