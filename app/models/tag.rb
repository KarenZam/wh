class Tag < ActiveRecord::Base
  before_save :upcase_name

  belongs_to :article

  validates :name, uniqueness: true

  private

  def upcase_name
    self.name.upcase!
  end
end
