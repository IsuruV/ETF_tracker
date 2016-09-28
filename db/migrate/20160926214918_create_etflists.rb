class CreateEtflists < ActiveRecord::Migration
  def change
    create_table :etfslists do |e|
      e.integer :etf_id
      e.integer :list_id
    end
  end
end
