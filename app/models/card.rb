class Card < ApplicationRecord
  has_many :card_progresses, dependent: :destroy
  belongs_to :topic
  belongs_to :course
  belongs_to :user, optional: true
  serialize :list_answer, Hash
  serialize :list_correct_answer, Hash

  def set_user_create_card user
    self.user_id = user.id
  end

  def set_course_for_card topic
    self.course_id = topic.course_id
  end
end
