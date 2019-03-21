class Topic < ApplicationRecord
  belongs_to :course
  has_many :topic_progresses, dependent: :destroy
  belongs_to :user, optional: true
  has_many :cards

  def set_user_create_topic user
    self.user_id = user.id
  end

end
