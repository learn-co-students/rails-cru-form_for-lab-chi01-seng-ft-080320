class SongsController < ApplicationController
    def index
        @songs = Song.all 
    end

    def show
        @song = Song.find(params[:id])
    end

    def create
        @song = Song.create(song_params(:name, :artist_id, :genre_id))
        if @song.save
            redirect_to song_path(@song)
        else
            flash[:errors] = @song.errors.full_messages
            redirect_to new_song_path
        end
    end

    def new 
        @song = Song.new 
    end

    def update
        @song = Song.find(params[:id])
        if @song.update(song_params(:name, :artist_id, :genre_id))
            redirect_to song_path(@song)
        else
            flash[:errors] = @song.errors.full_messages
            redirect_to edit_song_path(@song)
        end
    end

    def edit
        @song = Song.find(params[:id])
    end


    private

    def song_params(*args)
        params.require(:song).permit(*args)
    end
end