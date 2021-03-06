class Artist < ActiveRecord::Base
  # include SlugModule::InstanceMethods
  # extend SlugModule::ClassMethods
  has_many :songs
  has_many :genres, through: :songs

  def slug
    slugged = self.name.gsub(/[^0-9A-Za-z]/, '-').downcase
    slugged
  end

  def self.find_by_slug(slug)
    self.all.detect do |s|
      s if s.slug == slug
    end
  end
end
