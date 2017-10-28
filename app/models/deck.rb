class Deck < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :name, presence: true, length: { maximum: 255 }
  validates :text1_language, presence: true, length: { maximum: 255 }
  validates :text2_language, presence: true, length: { maximum: 255 }
  
  has_many :flashcards, dependent: :destroy
  
  accepts_nested_attributes_for :flashcards, allow_destroy: true
  
<<<<<<< HEAD
  # enum text1_language: { English: 0, Japanese: 1, French: 2, Spanish: 3, Portuguese: 4, Italian: 5, German: 6, Chinese: 7, Korean: 8 }, _prefix: true
  # enum text2_language: { English: 0, Japanese: 1, French: 2, Spanish: 3, Portuguese: 4, Italian: 5, German: 6, Chinese: 7, Korean: 8 }, _prefix: true  
  enum text1_language: { EnglishUS: 0, EnglishUK: 1, Arabic: 2, Chinese: 3, Czech: 4, Danish: 5, Dutch: 6, Finnish: 7, FrenchFR: 8, FrenchCA: 9, 
                          German: 10, Greek: 11, Hindi: 12, Japanese: 13, Hungarian: 14, Indonesian: 15, Italian: 16, Korean: 17, Norwegian: 18, Polish: 19,
                          PortuguesePT: 20, PortugueseBR: 21, Romanian: 22, Russian: 23, Slovakian: 24, SpanishES: 25, SpanishUS: 26, Swedish: 27,
                          Thai: 28, Turkish: 29}, _prefix: true
  enum text2_language: { EnglishUS: 0, EnglishUK: 1, Arabic: 2, Chinese: 3, Czech: 4, Danish: 5, Dutch: 6, Finnish: 7, FrenchFR: 8, FrenchCA: 9, 
                          German: 10, Greek: 11, Hindi: 12, Japanese: 13, Hungarian: 14, Indonesian: 15, Italian: 16, Korean: 17, Norwegian: 18, Polish: 19,
                          PortuguesePT: 20, PortugueseBR: 21, Romanian: 22, Russian: 23, Slovakian: 24, SpanishES: 25, SpanishUS: 26, Swedish: 27,
                          Thai: 28, Turkish: 29}, _prefix: true
=======
  enum text1_language: { English: 0, Japanese: 1, French: 2, Spanish: 3, Portuguese: 4, Italian: 5, German: 6, Chinese: 7, Korean: 8 }, _prefix: true
  enum text2_language: { English: 0, Japanese: 1, French: 2, Spanish: 3, Portuguese: 4, Italian: 5, German: 6, Chinese: 7, Korean: 8 }, _prefix: true  
  # enum text1_language: { EnglishUS: 0, EnglishUK: 1, Japanese: 2, French: 3, Spanish: 4, Portuguese: 5, Italian: 6, German: 7, Chinese: 8, Korean: 9 }, _prefix: true
  # enum text2_language: { EnglishUS: 0, EnglishUK: 1, Japanese: 2, French: 3, Spanish: 4, Portuguese: 5, Italian: 6, German: 7, Chinese: 8, Korean: 9 }, _prefix: true
>>>>>>> 6eaa702d2d3c5c48ce48ba349f90550ffb400413
  
  def text1_language_for_uttr
    case text1_language
    when "EnglishUS"
      'en-US'
<<<<<<< HEAD
    when "EnglishUK"
      'en-GB'
    when "Arabic"
      'ar-SA'
    when "Chinese"
      'zh-CN'
    when "Czech"
      'cs-CZ'
    when "Danish"
      'da-DK'
    when "Dutch"
      'nl-NL'
    when "Finnish"
      'fi-FI'
    when "FrenchFR"
      'fr-FR'
    when "FrenchCA"
      'fr-CA'
    when "German"
      'de-DE'
    when "Greek"
      'el-GR'
    when "Hindi"
      'hi-IN'
=======
    # when "EnglishUK"
    #   'en-GB'
>>>>>>> 6eaa702d2d3c5c48ce48ba349f90550ffb400413
    when "Japanese"
      'ja-JP'
    when "Hungarian"
      'hu-HU'
    when "Indonesian"
      'id-ID'
    when "Italian"
      'it-IT'
    when "Korean"
      'ko-KR'
    when "Norwegian"
      'nb-NO'
    when "Polish"
      'pl-PL'
    when "PortuguesePT"
      'pt-PT'
    when "PortugueseBR"
      'pt-BR'
    when "Romanian"
      'ro-RO'
    when "Russian"
      'ru-RU'
    when "Slovakian"
      'sk-SK'
    when "SpanishES"
      'es-ES'
<<<<<<< HEAD
    when "SpanishUS"
      'es-US'
    when "Swedish"
      'sv-SE'
    when "Thai"
      'th-TH'
    when "Turkish"
      'tr-TR'
=======
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
>>>>>>> 6eaa702d2d3c5c48ce48ba349f90550ffb400413
    end
    
    # case
    # when text1_language.english?
    # when text1_language.japanese?
    # end
  end
  
  def text2_language_for_uttr
    case text2_language
    when "EnglishUS"
      'en-US'
<<<<<<< HEAD
    when "EnglishUK"
      'en-GB'
    when "Arabic"
      'ar-SA'
    when "Chinese"
      'zh-CN'
    when "Czech"
      'cs-CZ'
    when "Danish"
      'da-DK'
    when "Dutch"
      'nl-NL'
    when "Finnish"
      'fi-FI'
    when "FrenchFR"
      'fr-FR'
    when "FrenchCA"
      'fr-CA'
    when "German"
      'de-DE'
    when "Greek"
      'el-GR'
    when "Hindi"
      'hi-IN'
=======
    # when "EnglishUK"
    #   'en-GB'
>>>>>>> 6eaa702d2d3c5c48ce48ba349f90550ffb400413
    when "Japanese"
      'ja-JP'
    when "Hungarian"
      'hu-HU'
    when "Indonesian"
      'id-ID'
    when "Italian"
      'it-IT'
    when "Korean"
      'ko-KR'
    when "Norwegian"
      'nb-NO'
    when "Polish"
      'pl-PL'
    when "PortuguesePT"
      'pt-PT'
    when "PortugueseBR"
      'pt-BR'
    when "Romanian"
      'ro-RO'
    when "Russian"
      'ru-RU'
    when "Slovakian"
      'sk-SK'
    when "SpanishES"
      'es-ES'
<<<<<<< HEAD
    when "SpanishUS"
      'es-US'
    when "Swedish"
      'sv-SE'
    when "Thai"
      'th-TH'
    when "Turkish"
      'tr-TR'
=======
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
>>>>>>> 6eaa702d2d3c5c48ce48ba349f90550ffb400413
    end
  end
end
