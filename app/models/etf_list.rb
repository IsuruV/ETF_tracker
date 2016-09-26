class Etflist < ActiveRecord::Base
  belongs_to :etf
  belongs_to :list
end
