class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price, :user_id

end