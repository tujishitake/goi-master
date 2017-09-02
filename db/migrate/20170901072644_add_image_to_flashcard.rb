class AddImageToFlashcard < ActiveRecord::Migration[5.0]
  def change
    add_column :flashcards, :image, :string
  end
end
