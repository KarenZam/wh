class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user

  belongs_to :reply_to, class_name: Comment, foreign_key: :comment_id
  has_many :replies, class_name: Comment, foreign_key: :comment_id

  validates :body, :user_id, presence: true

  # Add validation for either/or article or comment
end
