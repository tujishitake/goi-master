class Deck < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :text1_language, presence: true, length: { maximum: 255 }
  validates :text2_language, presence: true, length: { maximum: 255 }
end
