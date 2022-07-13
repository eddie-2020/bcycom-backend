class Motorcycle < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
  # has_attached_file :image, :styles => { :medium => "300x300", :thumb => "100x100" }
  # validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png"]

  validates :title, presence: true
  validates :model, presence: true
  validates :description, presence: true, length: { in: 1..10_000 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :images, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :discount, presence: true
end
