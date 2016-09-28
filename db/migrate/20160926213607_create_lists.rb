class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |l|
      l.string :name
      l.integer :user_id
    end
  end
end
