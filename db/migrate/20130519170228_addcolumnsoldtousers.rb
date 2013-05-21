class Addcolumnsoldtousers < ActiveRecord::Migration
  def change
    add_column :users, :sold, :decimal, scale: 8, precision: 16, default: 0
  end
end
