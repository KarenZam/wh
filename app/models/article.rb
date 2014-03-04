class Article < ActiveRecord::Base
  before_create :set_slug

  belongs_to :user
  has_many :comments

  validates :title, :body, presence: true
  validates :slug, uniqueness: { case_sensitive: false }

  private

  def set_slug
    i = 2
    s = sn = self.title.downcase.gsub(/\W+/, "-")
    while Article.find_by(slug: sn)
      sn = "#{s}-#{i}"
      i += 1
    end
    self.slug = sn
  end
end
