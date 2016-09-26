class CreateEtfs < ActiveRecord::Migration
  def change
    create_table :etfs do |e|
    e.string :symbol
    e.string :name
    e.string :price
    e.string :assets
    e.string :avg_vol
    e.string :ytd
    e.string :inverse
    e.string :leveraged
    e.string :week1
    e.string :week4
    e.string :year1
    e.string :year3
    e.string :year5
    e.string :etfdb
    e.string :inception
    e.string :er
    e.string :commission_free
    e.string :annual_dividend_rate
    e.string :dividend_date
    e.string :dividend
    e.string :annual_dividend_yield
    e.string :p_e_ratio
    e.string :beta
    e.string :holdings
    e.string :top_10
    e.string :l_bollinger
    e.string :u_bollinger
    e.string :support1
    e.string :resistance1
    e.string :rsi
    e.string :day_200
    e.string :cap_gains
    e.string :lt_cap_gains
    e.string :tax_form
    e.string :liquidity
    e.string :expenses
    e.string :performance
    e.string :volatility
    e.string :score_dividend
    e.string :concentration
    e.string :overall
    # e.string :about
    # e.string :top_10
    # e.string :sectors
    # e.string :market_cap
    end
  end
end
