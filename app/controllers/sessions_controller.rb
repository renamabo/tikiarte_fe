class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_info = {
        google_id: auth_hash['uid'],
        email: auth_hash['info']['email'],
        token: auth_hash['credentials']['token']
    }
    user = BackendFacade.user(user_info)
    session[:user] = user.id
  end
end
