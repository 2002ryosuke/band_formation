class Event < ApplicationRecord
  # before_create :generate_random_number

  belongs_to :user
  has_many :event_users
  has_many :users, through: :event_users

  validates :min_bans, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :max_bans, numericality: { only_integer: true, greater_than_or_equal_to: :min_bans }
  validates :random_number, uniqueness: true

  private

  # def generate_random_number
  #   count = 0 # ループ回数をカウント
  # begin
  #   self.random_number = SecureRandom.hex(10)
  #   count += 1
  #   puts "Generated random_number (attempt #{count}): #{self.random_number}"
  # rescue ActiveRecord::RecordNotUnique
  #   puts "RecordNotUnique rescued, retrying..."
  #   retry
  # end
  # puts "Generated random_number after #{count} attempts: #{self.random_number}" 
  # end
end