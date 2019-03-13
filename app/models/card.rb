class Card < ApplicationRecord
  has_many :card_progresses, dependent: :destroy
  has_many :users, through: :card_progresses
end
