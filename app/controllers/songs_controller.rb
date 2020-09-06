class SongsController < ApplicationController
    
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.search(params[:query])
        @songs = Song.filter(params[:song][:genre_id]) if params[:song]
    end

    def show
    end

    def new
        @song = Song.new
        @song.build_artist
        @song.build_genre
        2.times {@song.notes.build}
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def edit
    end

    def update
        @song.update(song_params)
        if @song.valid?
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        @song.destroy 
        redirect_to root_path
    end

    private

    def set_song
        @song = Song.find(params[:id])
    end

    def song_params
        params.require(:song).permit(:title, :artist_id, :genre_id, artist_attributes: [:name], genre_attributes: [:name], notes_attributes: [:content])
    end

end
