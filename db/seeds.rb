
song = Song.create(title: "Tonight")
song.build_artist(name: "Drake")
song.build_genre(name: "Hip-Hop")
song.notes.build(content: "This is the most important song ever.")
song.save