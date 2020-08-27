class RemoveGenreRdFromSongs < ActiveRecord::Migration[5.0]
  def change
    remove_column :songs, :genre_rd, :integer
  end
end
