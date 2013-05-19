class AddColumnUserIdUsers < ActiveRecord::Migration
  def changes
  
  add_column :users, :user_id, :integer
  
  end
end
