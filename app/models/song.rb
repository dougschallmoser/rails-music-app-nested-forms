class Song < ApplicationRecord

    belongs_to :artist
    belongs_to :genre
    has_many :notes

    validates :title, presence: true
    validates :artist, presence: true
    validates :genre, presence: true

    # accepts_nested_attributes_for :artist, reject_if: :all_blank # use this line for generic nested attribute writer method
    # accepts_nested_attributes_for :genre, reject_if: :all_blank # use this line for generic nested attribute writer method

    def artist_attributes=(artist_attributes)
        if artist_attributes[:name] != ""
            # self.build_artist(artist_attributes) # use this line if not checking for duplicates
            self.artist = Artist.find_or_create_by(name: artist_attributes[:name])
            self.artist.update(artist_attributes)
        end
    end

    def genre_attributes=(genre_attributes)
        if genre_attributes[:name] != ""
            # self.build_genre(genre_attributes) # use this line if not checking for duplicates
            self.genre = Genre.find_or_create_by(name: genre_attributes[:name])
            self.genre.update(genre_attributes)
        end
    end

    def notes_attributes=(notes_attributes)
        notes_attributes.values.each do |note_attributes| 
            if note_attributes[:content] != ""
                self.notes.build(note_attributes)
            end
        end
    end
    
end
