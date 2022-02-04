module NotificationsHelper
  def unchecked_notifications
    current_user.passive_notifications.where(check: false)
  end
end
