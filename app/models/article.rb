class Article < ActiveRecord::Base
  validates :title, presence: true,
                    length: { minimum: 5 }

  before_create :set_slug


  def to_param
    slug
  end


  protected

  def set_slug
    self.slug = self.title.downcase.gsub(' ', '-').gsub(/[^a-zA-Z\-]+/, '')
  end
end
