class Form::Deck < Deck
  REGISTRABLE_ATTRIBUTES = %i(name text1_language text2_language user_id)
  has_many :flashcards, class_name: 'Form::Flashcard', inverse_of: :deck
  
end