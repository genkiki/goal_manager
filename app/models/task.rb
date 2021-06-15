class Task < ApplicationRecord
  belongs_to :goal
  belongs_to :user

  validates :goal, presence: true
  validates :user, presence: true
  validates :content, presence: true
  validates :action, presence: true
  validates :status, presence: true

end
