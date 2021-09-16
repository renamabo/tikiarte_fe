class BackendService
  def self.connection
    Faraday.new('https://tiki-be.herokuapp.com') # or local host for now? confused.
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/users', user_info) # more guess work
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_by_email(email)
    response = connection.get("/api/v1/users/search?email=#{email}") #again, not sure.

    {
      status: response.status,
      body:  JSON.parse(response.body, symbolize_names: true)
    }
  end
end
