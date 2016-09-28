class List < ActiveRecord::Base
  belongs_to :user
  has_many :etf_lists, class_name: EtfList
  has_many :etfs, through: :etf_lists

  def slug
    @input = self.username.gsub(/\s|\W/,'-').downcase
  end

  def self.find_by_slug(slug)
      List.all.find do |a|
        slug == a.slug
      end
  end
end
