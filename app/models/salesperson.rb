class Salesperson < ApplicationRecord
  has_many :order_salesperson
  has_many :orders,  through:  :order_salesperson
end
