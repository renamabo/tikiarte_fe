class ArtPiecesController < ApplicationController

  def new
    @artist = UserArtistsFacade.artist(current_user.id, params[:id])
  end

  def create
  end







  private

  def artist_params
    params.permit(:username, :password, :password_confirmation, :user_id)
  end

end
