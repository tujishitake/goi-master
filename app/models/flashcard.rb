class Flashcard < ApplicationRecord
  belongs_to :deck, inverse_of: :flashcards
  
  # validates :deck_id, presence: true 
  validates :text1, presence: true, length: { maximum: 255 }
  validates :text2, presence: true, length: { maximum: 255 }
  
  def image
    flickr.photos.search(tags: text1, sort: "relevance", per_page: 1).first
  end
end
