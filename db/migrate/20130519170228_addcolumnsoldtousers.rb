class Addcolumnsoldtousers < ActiveRecord::Migration
 def change
  add_column :users, :sold, :float
 end
end
