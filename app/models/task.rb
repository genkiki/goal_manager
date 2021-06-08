class Task < ApplicationRecord
  belongs_to :goal
  belongs_to :user

  validates :goal_id, presence: true
  validates :user_id, presence: true
  validates :content, presence: true
  validates :action, presence: true
  validates :status, presence: true

end
