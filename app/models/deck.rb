class Deck < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :text1_language, presence: true, length: { maximum: 255 }
  validates :text2_language, presence: true, length: { maximum: 255 }
  
  has_many :flashcards, dependent: :destroy
  
  accepts_nested_attributes_for :flashcards, allow_destroy: true
  
  enum text1_language: { English: 0, Japanese: 1, French: 2, Spanish: 3 }, _prefix: true
  enum text2_language: { English: 0, Japanese: 1, French: 2, Spanish: 3 }, _prefix: true
  
  def text1_language_for_uttr
    case text1_language
    when "English"
      'en-US'
    when "Japanese"
      'ja-JP'
    when "French"
      'fr-FR'
    when "Spanish"
      'es-ES'
    end
    
    # case
    # when text1_language.english?
    # when text1_language.japanese?
    # end
  end
  
  def text2_language_for_uttr
    case text2_language
    when "English"
      'en-US'
    when "Japanese"
      'ja-JP'
    when "French"
      'fr-FR'
    when "Spanish"
      'es-ES'
    end
  end
end
