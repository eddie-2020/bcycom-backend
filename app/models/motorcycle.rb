class Motorcycle < ApplicationRecord
  belongs_to :user

  validates :model, presence: true
  validates :description, presence: true, length: { in: 1..100 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :image, presence: true
  validates :duration, presence: true, numericality: { greater_than_or_equal_to: 1 }
  validates :discount, presence: true
end
