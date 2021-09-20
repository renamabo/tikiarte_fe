class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    if auth_hash == :invalid_credentials
      flash[:error] = 'Oops, something went wrong!'
      redirect_to root_path
    else
      user_info = {
        google_id: auth_hash['uid'],
        email: auth_hash['info']['email'],
        token: auth_hash['credentials']['token']
      }
      user = BackendFacade.user(user_info)
      session[:user] = user.id
      redirect_to user_artists_path(user.id)
    end
  end

  def delete
    session[:user_id] = nil
    redirect_to root_path
  end
end
