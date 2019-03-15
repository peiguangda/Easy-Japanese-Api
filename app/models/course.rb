class Course < ApplicationRecord
  belongs_to :user
  has_many :user_courses, dependent: :destroy
end
