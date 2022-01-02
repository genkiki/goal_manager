class Follow < ApplicationRecord
  validates :follow_user_id, presence: true
  validates :followed_user_id, presence: true
end
