class Review < ApplicationRecord
  # validates :rate, presence: true
  validates :text, presence: true

  belongs_to  :user
  has_many :notifications, dependent: :destroy
end
