class Organization < ActiveRecord::Base
  has_many :affiliations, dependent: :destroy
end
