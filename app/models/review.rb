class Review < ApplicationRecord
  # validates :rate, presence: true
  validates :text, presence: true

  belongs_to  :user
end
