class Event < ApplicationRecord
  belongs_to :user

  validates :min_bans, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_bans, numericality: { only_integer: true, greater_than_or_equal_to: :min_bans }
end
