class RemaneTitleColumnToDecks < ActiveRecord::Migration[5.0]
  def change
    rename_column :decks, :title, :name
  end
end
