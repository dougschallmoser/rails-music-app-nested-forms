class AddSongIdToNotes < ActiveRecord::Migration[6.0]
  def change
    add_column :notes, :song_id, :integer
  end
end
