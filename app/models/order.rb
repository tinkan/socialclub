class Order < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :address, :seller
  validates :address, presence: true
  belongs_to :user
  belongs_to :product
  has_many :products

  
  def self.with_product with_product
  return scoped unless with_product.present?
  where(['user_id = ? ', "#{with_product}"])
end
end
