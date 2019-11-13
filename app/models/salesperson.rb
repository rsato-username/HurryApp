class Salesperson < ApplicationRecord
  has_many :orders_salespersons
  has_many :orders,  through:  :orders_salespersons
end
