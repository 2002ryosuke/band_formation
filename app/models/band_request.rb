class BandRequest < ApplicationRecord
  belongs_to :my_category, class_name: "Category", optional: true, foreign_key: 'my_category_id'
  belongs_to :recruting_category, class_name: "Category", optional: true, foreign_key: 'recruting_category_id'
  belongs_to :recruiting_user, class_name: "User", optional: true
  belongs_to :event
  belongs_to :user
  has_many :participation_requsests
  has_many :interest
end
