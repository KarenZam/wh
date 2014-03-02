class Subscriber < ActiveRecord::Base
  TIME_TO_EXPIRE = 1.week

  before_create :set_code
  before_save :downcase_email
  before_save :set_expiration

  validates :email, presence: true
  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i }

  def self.find_by_code(code)
    clean_up
    if subscriber = Subscriber.where('code = ?', code).take
      subscriber.save!
      return subscriber
    end
    nil
  end

  def set_expiration
    self.expires_at = TIME_TO_EXPIRE.from_now
  end

  def self.clean_up
    Subscriber.where('expires_at < ?', Time.now.gmtime).destroy_all
  end

  protected

  def set_code
    self.code = SecureRandom.urlsafe_base64
  end

  def downcase_email
    self.email.downcase!
  end
end
