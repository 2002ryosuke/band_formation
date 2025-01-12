class Category < ApplicationRecord
    has_many :band_requests, foreign_key: 'my_category_id'
    has_many :band_requests, foreign_key: 'request_category_id'
    has_many :participation_requsests
end
