class UserArtistsController < ApplicationController
  def index
    @artists = UserArtistsFacade.artists(current_user.id)
  end

  def show
    @artist = UserArtistsFacade.artist(current_user.id, params[:id])
    @images = BackendFacade.artist_images(params[:id])
  end

  def new; end

  def create
    if artist_params[:password] == artist_params[:password_confirmation]
      UserArtistsFacade.create(artist_params)
      redirect_to user_artists_path(current_user.id)
    else
      # flash[:danger] = 'Passwords do not match!'
      redirect_to new_user_artist_path(current_user.id)
    end
  end

  def edit
    @artist = UserArtistsFacade.artist(current_user.id, params[:id])
  end

  def update
    if artist_params[:password] == artist_params[:password_confirmation]
      UserArtistsFacade.update(artist_params, params[:id])
      redirect_to account_management_index_path
    else
      flash[:error] = 'Passwords do not match!'
      redirect_to edit_user_artist_path(params[:user_id], params[:id])
    end
  end

  def destroy
    UserArtistsFacade.delete(params[:user_id], params[:id])
    redirect_to account_management_index_path
  end

  private

  def artist_params
    params.permit(:username, :password, :password_confirmation, :user_id)
  end
end
