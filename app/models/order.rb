class Order < ActiveRecord::Base
	
  attr_accessible :product_id, :user_id, :address, :seller
	
	belongs_to :user
	
	belongs_to :product
	
	has_many :products

	validates :address, 
    presence: true

  validates :user,
    presence: true

  validates :product,
    presence: true

  validates :base, 
    user_sold: true


	def self.with_product p
		return scoped unless p.present?
		where(['user_id = ? ', "#{p}"])
  end
end
