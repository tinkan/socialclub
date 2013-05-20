class AddcolumnlastLogtousers < ActiveRecord::Migration
  def change
  add_column :users, :last_log, :date 
  end
end
