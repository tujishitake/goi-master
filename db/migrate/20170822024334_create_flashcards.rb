class CreateFlashcards < ActiveRecord::Migration[5.0]
  def change
    create_table :flashcards do |t|
      t.string :text1
      t.string :text2
      t.references :deck, foreign_key: true, null: false
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
