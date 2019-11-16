class Order < ApplicationRecord
  validates :seat, presence: true
  validates :drink, presence: true
  # validates :food, presence: true
  validates :salesperson, presence: true

  # validates_acceptance_of :confirming
  # after_validation :check_confirming

  # def check_confirming
  #   errors.dete(:confirming)
  #   self.confirming = errors.empty? ? '1' : ''
  # end

  belongs_to :user
  has_many :order_food
  has_many :foods,  through:  :order_food
  has_many :order_drink
  has_many :drinks,  through:  :order_drink
  has_many :order_salesperson
  has_many :salespersons,  through:  :order_salesperson
end
