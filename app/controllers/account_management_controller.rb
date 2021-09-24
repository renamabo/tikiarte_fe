# frozen_string_literal: true

class AccountManagementController < ApplicationController
  def index
    @artists = UserArtistsFacade.artists(current_user.id)
  end
end
