class User < ApplicationRecord
  validates :name, presence: true, length: {maximum: 255}
  validates :email, email: true
end
