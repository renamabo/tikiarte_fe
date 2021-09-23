class BackendFacade
  def self.user(user_info)
    response = BackendService.create_or_find_user(user_info)
    formatted_attributes = response[:data]
    GoogleUser.new(formatted_attributes)
  end

  def self.current_user(user_id)
    response = BackendService.find_user_by_id(user_id)
    formatted_attributes = response[:data]
    GoogleUser.new(formatted_attributes)
  end

  def self.artist_images(artist_id)
    response = BackendService.get_artist_images(artist_id)
    formatted_attributes = response[:data][:images]
    if formatted_attributes.nil? == false
      formatted_attributes.map do |image|
        Image.new(image[:id], image)
      end
    end
  end

  def self.update_image(input, id)
    image_info = {
      image: {
        status: input[:status],
      }
    }
    BackendService.update_artist_image(input[:artist_id], id, image_info)
  end

  def self.delete_image(user_id, artist_id)
    BackendService.delete_artist_image(user_id, artist_id)
  end

  def self.public_images
    response = BackendService.find_public_images
    if response.nil? == false
      formatted_attributes = response[:data]
      formatted_attributes.map do |image|
        Image.new(image[:id], image[:attributes])
      end
    end
  end

  def self.inspiration_image
    response = BackendService.find_random_image
    formatted_attributes = response[:data][:url]
    InspirationImage.new(formatted_attributes)
  end
end
