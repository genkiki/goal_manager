class Goal < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :content, presence: true
  validates :result, presence: true

end
