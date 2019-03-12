class UserCourse < ApplicationRecord
  belongs_to :user_info
  belongs_to :course
end
