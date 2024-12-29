class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :band_requests, foreign_key: 'recruting_user'
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  with_options presence: true do
    validates :name
    validates :status
  end
  enum status: {
    normal: 0,
    withdrawn: 1,
    banned: 2
  }
end