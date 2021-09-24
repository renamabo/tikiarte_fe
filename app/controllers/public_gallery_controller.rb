# frozen_string_literal: true

class PublicGalleryController < ApplicationController
  def index
    @public_images = BackendFacade.public_images
  end
end
