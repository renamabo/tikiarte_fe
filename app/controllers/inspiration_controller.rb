class InspirationController < ApplicationController
  def index
    if params[:image]
      @image = BackendFacade.inspiration_image
    end
  end
end
