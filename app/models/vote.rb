class Vote < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post, optional: true
  belongs_to :comment, optional: true

  # Custom function to find/create new vote record of the post/comment being voted on
  # Returns true if vote has been change/new Vote record; Returns false if vote has not been changed
  def self.vote(value, user, post = nil, comment = nil)
    if Vote.where(:user_id => user, :post_id => post, :comment_id => comment).first
      vote = Vote.where(:user_id => user, :post_id => post, :comment_id => comment).first
    else
      vote = Vote.new(value: value, user_id: user, post_id: post, comment_id: comment)
      vote.save
      return "new"
    end

    if vote.value != value
      vote.value = value
      vote.save
      return true
    end

    return false
  end
end
