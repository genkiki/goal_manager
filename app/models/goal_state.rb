class GoalState < ApplicationRecord
  has_many :goals
  validates :state, presence: true
end
