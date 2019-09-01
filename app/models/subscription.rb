class Subscription < ApplicationRecord
  belongs_to :event
  belongs_to :user, optional: true

  # Validates users email by presence in DB when anonym tries to subscribe for event
  validate :email_in_db_presence, unless: -> { user.present? }

  validates :event, presence: true
  validates :user_name, presence: true, unless: -> { user.present? }
  validates :user_email, presence: true, email: true, unless: -> { user.present? }

  validates :user, uniqueness: {scope: :event_id}, if: -> { user.present? }
  validates :user_email, uniqueness: {scope: :event_id}, unless: -> { user.present? }

  def email_in_db_presence
    errors.add(:user_email, :email_presence) if User.exists?(email: self.user_email)
  end

  def user_name
    if user.present?
      user.name
    else
      super
    end
  end

  def user_email
    if user.present?
      user.email
    else
      super
    end
  end
end