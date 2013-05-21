# encoding: UTF-8
require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test 'orders should have addresses' do
  	order = FactoryGirl.build(:order, address: nil)

    order.user.sold = 20

    assert_nil order.address
  	assert !order.valid?

  	order.address = 'Mon adresse'

  	assert order.valid?
  end

  test 'orders should validate the user balance' do
  	order = FactoryGirl.build(:order)

	assert !order.valid?, "La commande devrait-être invalide, l'acheteur n'a pas assez d'argent"

	order.user.sold = 20

    order.save!
	assert order.valid?, "La commande devrait-être valide car l'acheteur a les moyens"

  end
end
