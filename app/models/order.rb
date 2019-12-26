class Order < ApplicationRecord
  validates :seat, presence: true
  validates :drink_ids, presence: true
  # validates :food, presence: true
  # validates :salesperson_id


  def create_notification_order!(current_user, order_id)
    temp_ids = Order.select(:user_id).where(id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_order!(current_user, order_id, temp_id['user_id'])
    end
    save_notification_order!(current_user, order_id, user_id) if temp_ids.blank?
  end

  def save_notification_order!(current_user, order_id, visited_id)
    notification = current_user.active_notifications.new(
      order_id: order_id,
      visited_id: visited_id,
      action: 'order'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end


  belongs_to :user
  # has_many :foods

  has_many :orders_drinks
  has_many :drinks, through: :orders_drinks
  accepts_nested_attributes_for :orders_drinks

  # has_many :orders_salespersons
  belongs_to :salesperson, optional: true    #, through: :orders_salespersons
  # accepts_nested_attributes_for :orders_salespersons

  has_many :notifications, dependent: :destroy
end
