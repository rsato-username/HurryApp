class Notification < ApplicationRecord
  belongs_to :order, optional: true
  belongs_to :review, optional: true
end
