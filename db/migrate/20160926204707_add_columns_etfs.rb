class AddColumnsEtfs < ActiveRecord::Migration
  def change
    add_column :etfs, :about, :string
    add_column :etfs, :top_10_holdings, :string
    add_column :etfs, :sectors, :string
    add_column :etfs, :market_cap, :string
  end
end
