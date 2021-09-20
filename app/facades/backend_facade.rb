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

  def self.public_images
    response = BackendService.find_public_images
    formatted_attributes = response[:data]
    formatted_attributes.map do |image|
      Image.new(image)
    end
  end

  def self.inspiration_image
    response = BackendService.find_random_image
    formatted_attributes = response[:data]
    Image.new(formatted_attributes)
  end
end
