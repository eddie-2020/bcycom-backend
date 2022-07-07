class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { in: 1..6 }
  validates :password_confirmation, presence: true
end
