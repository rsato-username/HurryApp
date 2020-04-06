class NotificationsController < ApplicationController
  def index
    @notice = Notification.where(checked: true)
    @notifications = Notification.all.kaminari_page(params[:page]).per(15)
    @notifications.where(checked: true).each do |notification|
      notification.update(checked: false)
    end
  end
end
