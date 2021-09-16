class BackendFacade
  def self.user(user_info)
    email = user_info[:user][:email]
    response = BackendService.find_by_email(email)
    #maybe a conditional for errrors? i.e.:
    if response[:status] == 404
      user_attributes = BackendService.create_or_find_user(email)
      GoogleUser.new(user_attributes) # poros meg was referring to?
    else
      formatted_attributes = response[:body][:data][:attributes]
      GoogleUser.new(formatted_attributes)
  end
end
