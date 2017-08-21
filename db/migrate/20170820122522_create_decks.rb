class CreateDecks < ActiveRecord::Migration[5.0]
  def change
    create_table :decks do |t|
      t.string :title
      t.string :text1_language
      t.string :text2_language
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
