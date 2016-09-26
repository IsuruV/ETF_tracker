require 'pry'
require 'open-uri'
require 'nokogiri'


def scraper(symbol)
  page = Nokogiri::HTML(open("http://etfdb.com/etf/#{symbol}/"))
  about = page.css("div").css(".panel-body").css("p").text
  top_10 = page.css(".holdings-ol").css("a").text.split("\n").reject { |c| c.empty? }.push(";").to_s
  sectors = page.css("table").css(".base-table")[1].text.gsub("\n\n\n",";")
  market_cap = page.css("table").css(".base-table")[2].text.gsub("\n\n\n",";")


  binding.pry
end
scraper('SPY')

def self.scrape_front_page_gain_loss

      front_page = Nokogiri::HTML(open("https://www.google.com/finance"))
      gainers_losers = []
      gainers = []
      losers = []
      companies = {}

      front_page.css("div#topmovers").css(".g-wrap").css("tr").each do |company|
        company_name = company.css(".name").text.strip
        company_symbol = company.css(".symbol").text.strip
        company_change = company.css(".change").text.strip
        market_cap = company.css(".mktCap").text.strip
        gainers_losers << {company_name: company_name, symbol: company_symbol, gain_loss: company_change, market_cap: market_cap }
      end
      gainers_losers.each do |company|
        if company[:gain_loss].to_i <= 0.00 && company[:gain_loss] != "" && company[:company_name] != "" && company[:symbol] != "" && company[:market_cap] != ""
          losers << company
        elsif company[:gain_loss].to_i >= 0.00 && company[:gain_loss] != "" && company[:company_name] != "" && company[:symbol] != "" && company[:market_cap] != ""
          gainers << company
        end
      end

      companies[:gainers] = gainers
      companies[:losers] = losers
      companies
    end
