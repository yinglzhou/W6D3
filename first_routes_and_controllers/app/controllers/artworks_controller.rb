class ArtworksController < ApplicationController
    def index
        # debugger
        # @user = User.find(params[:user_id])
        # render json: @user.artworks

        @artwork_shares = Artwork.artworks_for_user_id(params[:user_id])
        render json: @artwork_shares

    
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork, status: :created

        else
            render json: @artwork.errors.full_messages, status: 422
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
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end