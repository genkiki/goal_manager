class Goal < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :tasks
  accepts_nested_attributes_for :tasks, allow_destroy: true
  has_many :comments
  has_many :notifications, dependent: :destroy

  validates :user_id, presence: true
  validates :content, presence: true
  validates :result, presence: true

  scope :recent, -> { order(updated_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    ['content', 'result', 'created_at']
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def create_notification_bookmark!(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and goal_id = ? and action = ?",
                                current_user.id, user_id, id, 'bookmark'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        goal_id: id,
        visited_id: user_id,
        action: 'bookmark'
      )
      if notification.visitor_id == notification.visited_id
        notification.check = true
      else
        notification.check = false
      end
      notification.save if notification.valid?
    end
  end

  def create_notification_comment!(current_user, comment_id)
    temp_ids = Comment.select(:user_id).where(goal_id: id).where.not(user_id: current_user.id).distinct
    temp_ids.each do |temp_id|
      save_notification_comment!(current_user, comment_id, temp_id['user_id'])
    end
    save_notification_comment!(current_user, comment_id, user_id) if temp_ids.blank?
  end

  def save_notification_comment!(current_user, comment_id, visited_id)
    notification = current_user.active_notifications.new(
      goal_id: id,
      comment_id: comment_id,
      visited_id: visited_id,
      action: 'comment'
    )
    if notification.visitor_id == notification.visited_id
      notification.check = true
    else
      notification.check = false
    end
    notification.save if notification.valid?
  end
end
