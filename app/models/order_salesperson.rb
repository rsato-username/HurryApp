class OrderSalesperson < ApplicationRecord
  belongs_to :order
  belongs_to :salesperson
end
