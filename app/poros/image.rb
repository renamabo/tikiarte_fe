class Image
  attr_reader :url, :id

  def initialize(image_info)
    @url = image_info[:attributes][:url]
    @id = image_info[:id]
  end
end
