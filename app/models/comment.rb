class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_many :notifications, dependent: :destroy
end
