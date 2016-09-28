require 'csv'
require 'pry'
require 'open-uri'
require 'nokogiri'

class Etf < ActiveRecord::Base
  has_many :etf_lists, class_name: EtfList
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
      company_arr = []
      # top_10 = page.css(".holdings-ol").css("a").text.split("\n").reject { |c| c.empty? }.push(";").to_s
      company_arr << page.css(".holdings-ol").css("li")[0].text
      company_arr << page.css(".holdings-ol").css("li")[1].text
      company_arr << page.css(".holdings-ol").css("li")[2].text
      company_arr << page.css(".holdings-ol").css("li")[3].text
      company_arr << page.css(".holdings-ol").css("li")[4].text
      company_arr << page.css(".holdings-ol").css("li")[5].text
      company_arr << page.css(".holdings-ol").css("li")[6].text
      company_arr << page.css(".holdings-ol").css("li")[7].text
      company_arr << page.css(".holdings-ol").css("li")[8].text
      company_arr << page.css(".holdings-ol").css("li")[9].text
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
    begin
      price = page.css("span").css(".bcSimpleQuoteLastValue").text
    rescue
      price = self.price
    end
    begin
      info= page.css("div#factsheet-collapse").css("a").first[:href]
    rescue
      info = "data not provided"
    end
    self.name = name
    self.about = about
    self.top_10_holdings = company_arr
    self.sectors = sectors
    self.market_cap = market_cap
    self.price = price
    self.info = info
    self.save
  end

    def slug
      @input = self.symbol.gsub(/\s|\W/,'-').downcase
    end

  def self.find_by_slug(slug)
      Etf.all.find do |a|
        slug == a.slug
      end
  end


end
