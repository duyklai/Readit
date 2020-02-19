class Post < ApplicationRecord
  validates :title, presence: true
  has_many :comments
  has_many :votes, dependent: :destroy
  belongs_to :user
end
