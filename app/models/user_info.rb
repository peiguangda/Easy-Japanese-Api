class UserInfo < ApplicationRecord
  has_many :cards, through: :card_progresses
  has_many :card_progresses, dependent: :destroy
  has_many :courses, dependent: :destroy, through: :user_courses
  has_many :user_courses, dependent: :destroy
  has_many :topics, dependent: :destroy, through: :topic_progresses
  has_many :topic_progresses, dependent: :destroy
  has_many :exam_scores, dependent: :destroy
end
