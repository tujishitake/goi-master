class ChangeColumnToDeck < ActiveRecord::Migration[5.0]
  def up
    change_column :decks, :text1_language, :integer, null: false, default: 0
    change_column :decks, :text2_language, :integer, null: false, default: 13
  end
  
  def down
    change_column :decks, :text1_language, :integer, null: false, default: 0
    change_column :decks, :text2_language, :integer, null: false, default: 13
  end
end
