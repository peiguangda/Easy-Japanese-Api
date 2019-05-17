class VideoScenario < ApplicationRecord
  belongs_to :topic
  has_many :video_time_items, dependent: :destroy
end
