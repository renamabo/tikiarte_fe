# frozen_string_literal: true

class Image
  attr_reader :id, :url, :status, :title, :description

  def initialize(id, image_data)
    @id = id
    @url = image_data[:upload_url]
    @status = image_data[:status]
    @title = image_data[:title]
    @description = image_data[:description]
  end
end
