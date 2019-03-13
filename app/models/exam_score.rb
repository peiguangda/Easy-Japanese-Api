class ExamScore < ApplicationRecord
  belongs_to :examinfo
  belongs_to :user
  belongs_to :exam_info
  belongs_to :exam_score_data
  belongs_to :topic
end
