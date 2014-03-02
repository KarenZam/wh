class Message < ActiveRecord::Base
  belongs_to :user

  validates :email, presence: true
  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i }
  validates :subject, :body, presence: true
end
