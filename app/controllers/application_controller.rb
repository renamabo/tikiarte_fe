# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    BackendFacade.current_user(session[:user]) if session[:user]
  end
end
