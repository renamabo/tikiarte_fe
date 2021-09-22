class ArtPiecesController < ApplicationController

  def new
    @artist = UserArtistsFacade.artist(current_user.id, params[:id])
  end

  def create
    # post request to BE (and on to amazon)
      # this will return: 1) blob 2) signed url 3) the other thing
        # is this a json? or hash?
    # if response (with signed_url & blob) is present
      # convert something into md5 format
      #
  end







  private

  def artist_params
    params.permit(:username, :password, :password_confirmation, :user_id)
  end

end
