class BackendFacade
  def self.user(user_info)
    email = user_info[:user][:email]
    response = BackendService.create_or_find_user(email)
    formatted_attributes = response[:body][:data]
    GoogleUser.new(formatted_attributes)
  end

  def self.current_user
    response = BackendService.find_user_by_id(session[:user])
    formatted_attributes = response[:body][:data]
    GoogleUser.new(formatted_attributes)
  end
end
