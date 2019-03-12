class Card < ApplicationRecord
  has_many :user_infos, through: :card_progresses
  has_many :card_progresses, dependent: :destroy
end
