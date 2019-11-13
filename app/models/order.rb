class Order < ApplicationRecord
  belongs_to :user
  has_many :orders_foods
  has_many :foods,  through:  :orders_foods
  has_many :orders_drinks
  has_many :drinks,  through:  :orders_drinks
  has_many :orders_salespersons
  has_many :salespersons,  through:  :orders_salespersons
end
