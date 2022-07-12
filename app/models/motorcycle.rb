class Motorcycle < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :model, presence: true
  validates :description, presence: true, length: { in: 1..10_000 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :image, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :discount, presence: true
end
