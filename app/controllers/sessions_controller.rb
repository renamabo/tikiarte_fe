class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_info = {
      user:
      {
        # google_id: auth_hash['uid'],
        email: auth_hash['info']['email'] # sounds like we only need email
        # token: auth_hash['credentials']['token']
      }
    }

    user = BackendFacade.user(user_info)

    session[:email] #stopping here because not really understanding if we use id or email here
  end
end

# naming conventions: for services/facades I used similar to Meg's video
# but we could also say somehting like GoogleUserService, etc.
