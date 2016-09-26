require 'csv'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Etf < ActiveRecord::Base
  has_many :etf_lists
  has_many :lists, through: :etf_lists

  def scrap
    page = Nokogiri::HTML(open("http://etfdb.com/etf/#{self.symbol}/"))
    about = page.css("div").css(".panel-body").css("p").text

    begin
      name =  page.css(".data-title").css("span").text
    rescue
      name = "Name"
    end
    begin
      top_10 = page.css(".holdings-ol").css("a").text.split("\n").reject { |c| c.empty? }.push(";").to_s
    rescue
      top_10 = "data not provided"
    end
    begin
      sectors = page.css("table").css(".base-table")[1].text.gsub("\n\n\n",";")
    rescue
      sectors = page.css(".holdings-ol").css("li").text.split("\n").reject { |c| c.empty? }.push(";").to_s
    end
    begin
        market_cap = page.css("table").css(".base-table")[2].text.gsub("\n\n\n",";")
    rescue
        market_cap = "data not provided"
    end
    self.name = name
    self.about = about
    self.top_10_holdings = top_10
    self.sectors = sectors
    self.market_cap = market_cap
    self.save
  end

end
