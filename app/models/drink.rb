class Drink < ApplicationRecord
  has_many :order_drink
  has_many :orders,  through:  :order_drink
end
