class Product < ActiveRecord::Base
  attr_accessible :category_id, :description, :name, :price, :user_id, :image_url, :product_id, :vente
  
  belongs_to :user
  belongs_to :category
  has_many :orders

validates :price, presence: true
  

  
  def self.search search_term
  return scoped unless search_term.present?
  where(['name LIKE ? OR description LIKE ? OR price LIKE ?', "%#{search_term}%", "%#{search_term}%", "%#{search_term}%"])
end

 def self.with_category with_category
  return scoped unless with_category.present?
  where(['category_id = ? ', "#{with_category.to_i}"])
end

 def self.with_user_id with_user_id
  return scoped unless with_user_id.present?
  where(['user_id LIKE ? ', "#{with_user_id}"])
end

 
end
