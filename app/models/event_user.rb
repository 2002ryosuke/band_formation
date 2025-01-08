class EventUser < ApplicationRecord
  belongs_to :event
  belongs_to :user
  enum status: { pending: 0, accepted: 1, rejected: 2 } #参加ステータス
end
