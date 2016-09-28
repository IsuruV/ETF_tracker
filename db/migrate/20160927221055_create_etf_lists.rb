class CreateEtfLists < ActiveRecord::Migration
  def change
    create_table :etf_lists do |e|
      e.integer :etf_id
      e.integer :list_id
    end
  end
end
