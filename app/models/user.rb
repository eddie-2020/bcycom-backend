class User < ApplicationRecord
  has_many :motorcycle

  validates :photo, presence: true
  validates :username, presence: true
  validates :email, presence: true, uniqueness: true
end
