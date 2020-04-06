module NotificationsHelper
  def notification_form(notification)
    # @comment=nil
    # visitor = link_to @notifications.visitor.name, notification.visitor, style:"font-weight: bold;"
    # your_post=link_to 'あなたの投稿', @notifications.micropost, style:"font-weight: bold;", remote: true
    case notification.action
      when "order" then
        "#{notification.visitor.name}が注文しました"
      when "review" then
        "#{notification.visitor.name}がレビューしました"
      # when "comment" then
      #   @comment=Comment.find_by(id:notification.comment_id)&.content
      #   "#{visiter}が#{your_post}にコメントしました"
    end
  end
end
