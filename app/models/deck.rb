class Deck < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :text1_language, presence: true, length: { maximum: 255 }
  validates :text2_language, presence: true, length: { maximum: 255 }
  
  has_many :flashcards, dependent: :destroy
  
  accepts_nested_attributes_for :flashcards, allow_destroy: true
end