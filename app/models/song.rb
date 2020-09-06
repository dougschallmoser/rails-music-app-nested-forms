class Song < ApplicationRecord

    belongs_to :artist
    belongs_to :genre
    has_many :notes

    validates :title, presence: true
    validates :artist, presence: true
    validates :genre, presence: true

    # accepts_nested_attributes_for :artist, reject_if: :all_blank # use this line for generic nested attribute writer method
    # accepts_nested_attributes_for :genre, reject_if: :all_blank # use this line for generic nested attribute writer method

    def self.search(query)
        if query.present?
            self.where("title LIKE ?", "%#{query}%")
        else
            self.all
        end
    end

    def artist_attributes=(artist_attributes)
        # self.build_artist(artist_attributes) # use this line if not checking for duplicates
        if artist_attributes[:name].present?
            self.artist = Artist.find_or_create_by(artist_attributes)
            # self.artist = Artist.find_or_create_by(name: artist_attributes[:name]) #only necessary if artist has attributes other than :name
            # self.artist.update(artist_attributes) #only necessary if artist has attributes other than :name
        end
    end

    def genre_attributes=(genre_attributes)
        # self.build_genre(genre_attributes) # use this line if not checking for duplicates
        if genre_attributes[:name].present?
            self.genre = Genre.find_or_create_by(genre_attributes)
            # self.genre = Genre.find_or_create_by(name: genre_attributes[:name]) #only necessary if genre has attributes other than :name
            # self.genre.update(genre_attributes) #only necessary if genre has attributes other than :name
        end
    end

    def notes_attributes=(notes_attributes)
        notes_attributes.values.each do |note_attributes| 
            if note_attributes[:content].present?
                self.notes.build(note_attributes)
            end
        end
    end
    
end
