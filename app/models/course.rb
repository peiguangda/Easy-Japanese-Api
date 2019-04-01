class Course < ApplicationRecord
  belongs_to :user
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses, source: :user
  has_many :topics, dependent: :destroy
  has_many :cards, dependent: :destroy
end
