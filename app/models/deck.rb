class Deck < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :text1_language, presence: true, length: { maximum: 255 }
  validates :text2_language, presence: true, length: { maximum: 255 }
  
  has_many :flashcards, dependent: :destroy
  
  accepts_nested_attributes_for :flashcards, allow_destroy: true
  
  enum text1_language: { English: 0, Japanese: 1, French: 2, Spanish: 3, Portuguese: 4, Italian: 5, German: 6, Chinese: 7, Korean: 8 }, _prefix: true
  enum text2_language: { English: 0, Japanese: 1, French: 2, Spanish: 3, Portuguese: 4, Italian: 5, German: 6, Chinese: 7, Korean: 8 }, _prefix: true  
  # enum text1_language: { EnglishUS: 0, EnglishUK: 1, Japanese: 2, French: 3, Spanish: 4, Portuguese: 5, Italian: 6, German: 7, Chinese: 8, Korean: 9 }, _prefix: true
  # enum text2_language: { EnglishUS: 0, EnglishUK: 1, Japanese: 2, French: 3, Spanish: 4, Portuguese: 5, Italian: 6, German: 7, Chinese: 8, Korean: 9 }, _prefix: true
  
  def text1_language_for_uttr
    case text1_language
    when "English"
      'en-US'
    # when "EnglishUK"
    #   'en-GB'
    when "Japanese"
      'ja-JP'
    when "French"
      'fr-FR'
    when "Spanish"
      'es-ES'
    # when "SpanishUS"
    #   'es-US'
    when "Portuguese"
      'pt-PT'
    # when "PortugueseBR"
    #   'pt-BR'
    when "Italian"
      'it-IT'
    when "German"
      'de-DE'
    when "Chinese"
      'zh-CN'
    when "Korean"
      'ko-KR'
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
    # when "EnglishUK"
    #   'en-GB'
    when "Japanese"
      'ja-JP'
    when "French"
      'fr-FR'
    when "Spanish"
      'es-ES'
    # when "SpanishUS"
    #   'es-US'
    when "Portuguese"
      'pt-PT'
    # when "PortugueseBR"
    #   'pt-BR'
    when "Italien"
      'it-IT'
    when "German"
      'de-DE'
    when "Chinese"
      'zh-CN'
    when "Korean"
      'ko-KR'
    end
  end
end
