class Post < ApplicationRecord
  validates :title, :body, presence: true
  has_many :comments
  belongs_to :user, optional: true
end
