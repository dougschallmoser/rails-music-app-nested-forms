class CreateSongs < ActiveRecord::Migration[6.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.integer :genre_id
      t.integer :artist_id

      t.timestamps
    end
  end
end