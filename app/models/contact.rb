class Contact < ActiveRecord::Base
  belongs_to :user
  belongs_to :organization

  validates :email, presence: true
  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i }
  validates :subject, :message, presence: true
end
