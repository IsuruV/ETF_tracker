class User < ActiveRecord::Base
  has_many :lists
  # has_many :etf_lists, through: :lists
  # has_many :etfs, through: :etf_lists
end
