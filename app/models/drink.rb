class Drink < ApplicationRecord
  has_many :orders_drinks
  has_many :orders, through: :orders_drinks
end
