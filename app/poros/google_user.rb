class GoogleUser
  attr_reader :id, :email

  def initialize(user_info)
    @id = user_info[:id]
    @email = user_info[:attributes][:email]
  end
end
