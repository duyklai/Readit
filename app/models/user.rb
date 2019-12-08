class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :comments

  def post_total
    total_points = 0
    posts.each do |post|
      total_points = total_points + post.points
    end
    return total_points
  end

  def comment_total
    total_points = 0
    comments.each do |comment|
      total_points = total_points + comment.points
    end
    return total_points
  end

end
