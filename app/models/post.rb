class Post < ApplicationRecord
  validates :title, :user_id, presence: true
  has_many :comments
  has_many :votes, dependent: :destroy
  belongs_to :user, optional: true
  belongs_to :tag, optional: true
end
