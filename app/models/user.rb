class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates_uniqueness_of :username
  has_many :posts
  has_many :comments
  has_many :votes

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
