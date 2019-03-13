class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :users, through: :user_courses
end
