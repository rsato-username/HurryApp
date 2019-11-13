class Food < ApplicationRecord
  has_many :orders_foods
  has_many :orders,  through:  :orders_foods
end
