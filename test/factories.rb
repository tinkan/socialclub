require 'factory_girl'

FactoryGirl.define do
  factory :user do
    email 'john@dd.oe'
    sold 5
    password 'password'
    password_confirmation 'password'
  end

  factory :product do
  	price 10
  	name 'Une NES'
  end

  factory :order do
  	product
  	user
  	address 'Mon adresse'
  end

end