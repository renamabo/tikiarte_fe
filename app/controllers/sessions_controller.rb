class SessionsController < ApplicationController
  def create
    auth_hash = request.env['omniauth.auth']
    user_info = {         # I feel like this data might be easier to work with in a hash
      user:
      {
        google_id: auth_hash['uid'],
        email: auth_hash['info']['email'],
        token: auth_hash['credentials']['token']
      }
    }

    user = BackendFacade.user(user_info)

    require "pry"; binding.pry

    # google_id = auth_hash['uid']
    # email = auth_hash['info']['email']
    # token = auth_hash['credentials']['token']

    # BackendService.register_user(google_id, email, token) # does it make more sense to call the service or facade?
  end
end

# naming conventions: for services/facades I used similar to Meg's video
# but we could also say somehting like GoogleUserService, etc.
