class VideoTimeItem < ApplicationRecord
  belongs_to :video_scenario
  serialize :list_card_id, Hash
  serialize :data, Hash
end
