class TaskState < ApplicationRecord
  validates :state presence: true
end
