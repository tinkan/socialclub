class Addcolumnsellertoorders < ActiveRecord::Migration
  def change
  
  add_column :orders, :seller, :integer
  end
end
