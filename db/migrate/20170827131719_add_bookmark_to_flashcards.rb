class AddBookmarkToFlashcards < ActiveRecord::Migration[5.0]
  def change
    add_column :flashcards, :bookmark, :boolean, default: false, null: false
  end
end
