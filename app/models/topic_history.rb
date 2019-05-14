class TopicHistory < ApplicationRecord
  belongs_to :user
  belongs_to :topic
  serialize :data, Hash
end
