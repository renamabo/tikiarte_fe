# frozen_string_literal: true

class InspirationController < ApplicationController
  def index
    @image = BackendFacade.inspiration_image if params[:image]
  end
end
