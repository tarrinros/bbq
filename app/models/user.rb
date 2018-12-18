class User < ApplicationRecord
  has_many :events

  validates :name, presence: true, length: {maximum: 255}
  validates :email, email: true, uniqueness: true
end
