class User < ApplicationRecord
  has_secure_password

  validates :username, presence: true
  validates :password, presence: true, length: { minimum: 4, maximum: 20 }
end
