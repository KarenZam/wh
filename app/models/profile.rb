class Profile < ActiveRecord::Base
  belongs_to :user

  validates :name_given, :name_family, presence: true

  def name
    [self.given, self.family].join(" ")
  end
end
