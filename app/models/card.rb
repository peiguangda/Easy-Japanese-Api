class Card < ApplicationRecord
  has_many :card_progresses, dependent: :destroy
  belongs_to :topic
  belongs_to :course
  belongs_to :user, optional: true

  def set_user_create_card user
    self.user_id = user.id
  end

  def set_course_for_card course
    self.course_id = course.id
  end
end
