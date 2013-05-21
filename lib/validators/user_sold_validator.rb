class UserSoldValidator < ActiveModel::Validator
  
  def validate(record)
    if record.user && record.product && record.user.sold && record.product.price && record.user.sold < record.product.price
      record.errors[:base] << 'Fonds insuffisants'
  	end
  end

end