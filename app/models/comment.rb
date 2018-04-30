class Comment < ApplicationRecord
  belongs_to :post
  # belongs_to :user
  validates :commenter,
  presence: true,
  length: { minimum: 4, maximum: 20 }
  validates :body, presence: true
end
