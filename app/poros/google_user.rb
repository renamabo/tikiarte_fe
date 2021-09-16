class GoogleUser
  attr_reader :email

  def initialize(user_info)
    @director_email = user_info[:email]
  end
end
