class NotificationsController < ApplicationController
  def index
    @notifications = current_user.passive_notifications   #.page(params[:page]).per(20)
    @notice = @notifications.where.not(visitor_id: current_user.id)
    
    @notifications.where(checked: false).each do |notification|
      notification.update_attributes(checked: true)
    end
  end
end
