class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all 
        render json: @artworks
    end

    def create
        @artworks = Artwork.new(artwork_params)
        if @artworks.save
            render json: @artwork, status: :created

        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork.update(artwork_params)
            redirect_to artworks_url(@artwork.id)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        if @artwork.destroy
            render json: "Artwork destroyed"
        else
            render json: @artwork.full_messages, status: 422
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artwork_id)
    end
end