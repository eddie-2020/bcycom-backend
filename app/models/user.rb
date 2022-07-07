class User < ApplicationRecord
    has_secure_password

    validates :username, presence: true
    validates :password, presence: true, length: { in: 1..6 }
end