class Food < ApplicationRecord
  has_many :order_food
  has_many :orders,  through:  :order_food
end
