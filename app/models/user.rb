class User < ApplicationRecord
  validates :photo, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
