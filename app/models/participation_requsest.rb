class ParticipationRequsest < ApplicationRecord
  belongs_to :category
  belongs_to :user
  belongs_to :band_request
  has_many :interest
end
