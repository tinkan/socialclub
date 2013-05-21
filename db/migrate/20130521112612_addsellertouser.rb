class Addsellertouser < ActiveRecord::Migration
  def change 
  	add_column :users, :seller, :boolean
  end
end
