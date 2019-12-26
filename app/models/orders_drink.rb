class OrdersDrink < ApplicationRecord
  belongs_to :order
  belongs_to :drink
end
