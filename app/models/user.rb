class User < ActiveRecord::Base
  TIME_TO_EXPIRE = 1.hour

  before_save :encrypt_password
  before_save :downcase_email
  before_create :set_password

  has_many :messages
  has_many :profile

  attr_accessor :password, :password_confirmation

  validates :email, uniqueness: { case_sensitive: false }
  validates :email, format: { with: /\A[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i }
  validates :password, presence: true, on: :create
  validates :password, confirmation: true
  validates :password_confirmation, presence: true, unless: Proc.new { |user| user.password.blank? }

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    user.password_matches?(password) if user
  end

  def self.find_by_code(code)
    if user = User.where('code = ?', code).take
      if user.expires_at >= Time.now.gmtime
        user.set_expiration
        return user
      end
      unset_password_reset
    end

    nil
  end

  def password_matches?(password)
    return self if self.fish == BCrypt::Engine.hash_secret(password, self.salt)
  end

  def set_password_reset
    self.code = SecureRandom.urlsafe_base64
    set_expiration
  end

  def set_expiration
    self.expires_at = TIME_TO_EXPIRE.from_now
    self.save!
  end

  def reset_password(password_params)
    if self.update(password_params)
      unset_password_reset
    end
  end

  def name
    if self.profile and self.profile.name
      self.profile.name
    else
      "No profile"
    end
  end

  protected

  def unset_password_reset
    self.code = nil
    self.expires_at = nil
    self.save!
    nil
  end

  def encrypt_password
    if password.present?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(password, self.salt)
    end
  end

  def downcase_email
    self.email.downcase!
  end

  def set_password
    if self.password.blank?
      self.salt = BCrypt::Engine.generate_salt
      self.fish = BCrypt::Engine.hash_secret(SecureRandom.urlsafe_base64, self.salt)
    end
  end
end