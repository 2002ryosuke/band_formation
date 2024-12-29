class BandRequest < ApplicationRecord
  belongs_to :my_category, class_name: "Category", optional: true
  belongs_to :recruting_category, class_name: "Category", optional: true
  belongs_to :recruiting_user, class_name: "User", optional: true
  belongs_to :user
  belongs_to :event
end
