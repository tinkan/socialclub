class Addcolumnadresstoorder < ActiveRecord::Migration
  def change
  
  add_column :orders, :address, :string
  
  end
end
