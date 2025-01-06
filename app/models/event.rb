class Event < ApplicationRecord
  belongs_to :user
  has_many :event_users
  has_many :users, through: :event_users
  has_many :band_requests, dependent: :destroy

  validates :min_bans, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_bans, numericality: { only_integer: true, greater_than_or_equal_to: :min_bans }
  validates :random_number, uniqueness: true
end