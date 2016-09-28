class AddColumnInfo < ActiveRecord::Migration
  def change
    add_column :etfs, :info, :string
  end
end
