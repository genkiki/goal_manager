class Goal < ApplicationRecord
  belongs_to :user
  has_many :tasks, inverse_of: :goal
  accepts_nested_attributes_for :tasks, allow_destroy: true

  validates :user_id, presence: true
  validates :content, presence: true
  validates :result, presence: true

  scope :recent, -> { order(created_at: :desc) }

  def self.ransackable_attributes(auth_object = nil)
    ['content', 'result', 'created_at']
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end
end
