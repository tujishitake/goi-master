class DropTableBookmarks < ActiveRecord::Migration[5.0]
  def change
    drop_table :bookmarks
  end
end
