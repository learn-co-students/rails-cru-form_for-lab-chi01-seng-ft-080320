class ArtistsController < ApplicationController

    def index
        @artists = Artist.all 
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def create
        @artist = Artist.create(artist_params(:name, :bio))
        if @artist.save
            redirect_to artist_path(@artist)
        else
            flash[:errors] = @artist.errors.full_messages
            redirect_to new_artist_path
        end
    end

    def new 
        @artist = Artist.new 
    end

    def update
        @artist = Artist.find(params[:id])
        if @artist.update(artist_params(:name, :bio))
            redirect_to artist_path(@artist)
        else 
            flash[:errors] = @artist.errors.full_messages 
            redirect_to edit_artist_path(@artist)
        end
    end

    def edit
        @artist = Artist.find(params[:id])
    end


    private

    def artist_params(*args)
        params.require(:artist).permit(*args)
    end

end