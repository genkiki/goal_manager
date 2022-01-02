class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :goal, optional: true
  belongs_to :comment, optional: true
  belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
  belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true

  validates :visitor_id, :visited_id, :action, presence: true #follow,bookmark,commentで共通
  validates :goal_id, presence: true, if: :bookmark_action?
  validates :comment_id, :goal_id, presence: true, if: :comment_action?

  def follow_action?
    action == "follow"
  end
  def bookmark_action?
    action == "bookmark"
  end
  def comment_action?
    action == "comment"
  end
end
