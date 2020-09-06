class ArtistsController < ApplicationController

    before_action :set_artist, only: [:show, :edit, :update, :destroy]

    def index
        @artists = Artist.search(params[:query])
    end

    def show
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
        @artist.destroy 
        redirect_to artists_path
    end

    private

    def set_artist
        @artist = Artist.find(params[:id])
    end
end
