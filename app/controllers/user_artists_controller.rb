class UserArtistsController < ApplicationController
  def index
    @artists = UserArtistsFacade.artists(current_user.id)
  end

  def new
  end

  def create
    if artist_params[:password] == artist_params[:password_confirmation]
      UserArtistsFacade.create(artist_params)
      redirect_to user_artists_path(current_user.id)
    else
      # flash[:danger] = 'Passwords do not match!'
      redirect_to new_user_artist_path(current_user.id)
    end
  end

  private
  def artist_params
    params.permit(:username, :password, :password_confirmation, :user_id)
  end
end
