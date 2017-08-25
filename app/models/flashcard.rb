class Flashcard < ApplicationRecord
  belongs_to :deck, inverse_of: :flashcards
  # belongs_to :user
  
  # validates :user_id, presence: true
  # validates :deck_id, presence: true 
  validates :text1, presence: true, length: { maximum: 255 }
  validates :text2, presence: true, length: { maximum: 255 }
end
