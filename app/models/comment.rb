class Comment < ApplicationRecord
  default_scope -> { order(created_at: :asc) }
  belongs_to :user
  belongs_to :goal
  has_many :notifications, dependent: :destroy

  validates :comment, presence: true
end
