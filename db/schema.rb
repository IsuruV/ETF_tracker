# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160926204707) do

  create_table "etfs", force: :cascade do |t|
    t.string "symbol"
    t.string "name"
    t.string "price"
    t.string "assets"
    t.string "avg_vol"
    t.string "ytd"
    t.string "inverse"
    t.string "leveraged"
    t.string "week1"
    t.string "week4"
    t.string "year1"
    t.string "year3"
    t.string "year5"
    t.string "etfdb"
    t.string "inception"
    t.string "er"
    t.string "commission_free"
    t.string "annual_dividend_rate"
    t.string "dividend_date"
    t.string "dividend"
    t.string "annual_dividend_yield"
    t.string "p_e_ratio"
    t.string "beta"
    t.string "holdings"
    t.string "top_10"
    t.string "l_bollinger"
    t.string "u_bollinger"
    t.string "support1"
    t.string "resistance1"
    t.string "rsi"
    t.string "day_200"
    t.string "cap_gains"
    t.string "lt_cap_gains"
    t.string "tax_form"
    t.string "liquidity"
    t.string "expenses"
    t.string "performance"
    t.string "volatility"
    t.string "score_dividend"
    t.string "concentration"
    t.string "overall"
    t.string "about"
    t.string "top_10_holdings"
    t.string "sectors"
    t.string "market_cap"
  end

end
