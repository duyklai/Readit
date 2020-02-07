module VotesHelper
  def checkVoted(user = nil, post = nil, comment = nil)
    if Vote.where(:user_id => user, :post_id => post, :comment_id => comment).first
      return true
    end

    return false
  end  
end
  