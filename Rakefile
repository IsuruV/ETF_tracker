ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require 'csv'

desc "Imports a CSV file into an ActiveRecord table"
task :import do
    CSV.foreach('/Users/isuru/Desktop/Assessment 2/ETF_Comparer/db/ETFdb .csv', :headers => true) do |row|
      Etf.create!(row.to_hash)
    end
end

# Type `rake -T` on your command line to see the available rake tasks.
