class Comment < ApplicationRecord
  # Filling the blank ancestry attribute with nil
  before_validation do
    self.ancestry = nil if self.ancestry.blank?
  end
  validates :body, presence: true
  belongs_to :post, optional: true
  belongs_to :user, optional: true

  has_ancestry
end
