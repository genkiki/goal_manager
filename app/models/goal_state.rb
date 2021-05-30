class GoalState < ApplicationRecord
  validates :state, presence: true
end
