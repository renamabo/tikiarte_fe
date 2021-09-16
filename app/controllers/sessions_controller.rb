class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_info = {
      user:
      {
        email: auth_hash['info']['email']
      }
    }
    user = BackendFacade.user(user_info)
    session[:user] = user.id
  end
end
