class Affiliation < ActiveRecord::Base
  belongs_to :profile
  belongs_to :organization
end
