class ArtworksController < ApplicationController

    # def index
    #     @artworks = Artwork.all
    #     render json: @artworks
    # end

    def index
        @user = User.find(params[:user_id])
        render json: {'artworks created' => @user.artworks, 'artworks viewed' => @user.shared_artworks}
    end

    def show
        @artworks = Artwork.find(params[:id])
        render json: @artworks
    end

    def update
        @artworks = Artwork.find(params[:id])
        if @artworks.update(artwork_params)
            redirect_to artwork_url(@artworks)
        else
            render json: @artworks.errors.full_messages, status: :unprocessable_entity
        end
    end

    def create
        artwork = Artwork.new(params.require(:artwork).permit(:title, :image_url, :artist_id))
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        @artwork.destroy
        render json: @artwork
    end


    private
    def artwork_params
        params.require(:artwork).permit(:body)
    end


end