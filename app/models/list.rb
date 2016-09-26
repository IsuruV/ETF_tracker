class List < ActiveRecord::Base
  belongs_to :user
  has_many :etf_lists
  has_many :etfs, through: :etf_lists
end
