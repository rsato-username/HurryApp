class Review < ApplicationRecord
  validates :rate, presence: true
  # validates :text, presence: true

  def create_notification_review!(current_user, review_id)
    temp_ids = Review.select(:user_id).where(id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_review!(current_user, review_id, temp_id['user_id'])
    end
    save_notification_review!(current_user, review_id, user_id) if temp_ids.blank?
  end

  def save_notification_review!(current_user, review_id, visited_id)
    notification = current_user.active_notifications.new(
      review_id: review_id,
      visited_id: visited_id,
      action: 'review'
    )
    if notification.visitor_id == notification.visited_id
      notification.checked = true
    end
    notification.save if notification.valid?
  end

  belongs_to  :user
  has_many :notifications, dependent: :destroy
end
