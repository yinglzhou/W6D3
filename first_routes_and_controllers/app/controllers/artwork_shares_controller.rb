class ArtworkSharesController < ApplicationController
  def create
    @artwork_share = ArtworkShare.new(artwork_share_params)
    if @artwork_share.save
      render json: @artwork_share, status: :created
    else
      render json: @artwork_share.errors.full_messages, status: 422
    end
  end

  def destroy
    @artwork_share = ArtworkShare.find(params[:id])
    if @artwork_share.destroy
      render json: "Artwork_share destroyed"
    else
      render json: @artwork_share.full_messages, status: 422
    end
  end

  private

  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id)
  end
end
