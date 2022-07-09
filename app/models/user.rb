class User < ApplicationRecord
  has_secure_password

  validates :photo, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
