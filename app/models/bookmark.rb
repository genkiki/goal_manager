class Bookmark < ApplicationRecord
  validates :user_id, presence: true
  validates :goal_id, presence: true

  belongs_to :user
  belongs_to :goal

end
