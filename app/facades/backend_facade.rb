class BackendFacade
  def self.user(user_info)
    response = BackendService.create_or_find_user(user_info)
    formatted_attributes = response[:data]
    GoogleUser.new(formatted_attributes)
  end

  def self.current_user
    response = BackendService.find_user_by_id(session[:user])
    formatted_attributes = response[:data]
    GoogleUser.new(formatted_attributes)
  end
end
