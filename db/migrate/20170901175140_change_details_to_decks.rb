class ChangeDetailsToDecks < ActiveRecord::Migration[5.0]
  def up
    remove_column :decks, :text1_language, :string
    remove_column :decks, :text2_language, :string
    add_column :decks, :text1_language, :integer, null: false, default: 0
    add_column :decks, :text2_language, :integer, null: false, default: 1
  end
  
  def down
    add_column :decks, :text1_language, :string
    add_column :decks, :text2_language, :string
  end
end
