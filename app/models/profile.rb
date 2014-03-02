class Profile < ActiveRecord::Base
  belongs_to :user
  has_many :affiliations, dependent: :destroy

  validates :profile_name, :name_given, :name_family, presence: true
  validates :profile_name, uniqueness: { scope: :user_id, case_sensitive: false }

  def name
    self.profile_name
  end

  def full_name
    [self.given, self.family].join(" ")
  end
end
