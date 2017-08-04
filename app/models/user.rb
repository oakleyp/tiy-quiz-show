class User < ApplicationRecord
  validates :name, presence: true
  validates :username, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password
end
