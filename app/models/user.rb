class User < ApplicationRecord
  has_many :goals, dependent: :destroy
  has_many :tasks, dependent: :destroy
  # has_many :users, through: :follows
  has_secure_password
  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 8 }

  has_one_attached :image
end
