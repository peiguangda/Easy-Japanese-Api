class User < ApplicationRecord
  before_create :generate_authentication_token!
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :card_progresses, dependent: :destroy
  has_many :cards, through: :card_progresses
  has_many :user_courses, dependent: :destroy
  has_many :courses, dependent: :destroy
  has_many :topic_progresses, dependent: :destroy
  has_many :topics, dependent: :destroy
  has_many :cards, dependent: :destroy
  has_many :exam_scores, dependent: :destroy

  validates :auth_token, uniqueness: true

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists? auth_token: auth_token
  end

end
