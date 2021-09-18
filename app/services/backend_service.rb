class BackendService
  def self.connection
    Faraday.new('https://tiki-be.herokuapp.com')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/users', user_info)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_user_by_id(user_id)
    response = connection.get('/api/v1/users', user_id)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user_artist(artist_info)
    binding.pry
    response = connection.post("/api/v1/directors/#{current_user.id}/artists", artist_info)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_artists
    response = connection.get("/api/v1/directors/#{current_user.id}/artists")
    JSON.parse(response.body, symbolize_names: true)
  end
end
