class User < ActiveRecord::Base
  has_secure_password
  has_many :lists
  # has_many :etf_lists, through: :lists
  # has_many :etfs, through: :etf_lists
  def slug
    @input = self.username.gsub(/\s|\W/,'-').downcase
  end

  def self.find_by_slug(slug)
      List.all.find do |a|
        slug == a.slug
      end
  end
end
