class Comment < ApplicationRecord
  validates :body, presence: true
  belongs_to :post, optional: true
  belongs_to :user, optional: true
end
