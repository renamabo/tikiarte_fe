class BackendService
  def self.connection
    Faraday.new('https://tikiarte-be.herokuapp.com')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/sessions/create') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = { director: user_info }.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_user_by_id(user_id)
    response = connection.get("/api/v1/directors/#{user_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.create_user_artist(artist_info, user_id)
    response = connection.post("/api/v1/directors/#{user_id}/artists", artist_info)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_artists(user_id)
    response = connection.get("/api/v1/directors/#{user_id}/artists")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.get_artist(user_id, id)
    response = connection.get("/api/v1/directors/#{user_id}/artists/#{id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.update_user_artist(artist_info, user_id, artist_id)
    response = connection.put("/api/v1/directors/#{user_id}/artists/#{artist_id}", artist_info)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.delete_user_artist(user_id, artist_id)
    response = connection.delete("/api/v1/directors/#{user_id}/artists/#{artist_id}")
  end

  def self.find_public_images
    response = connection.get('/api/v1/public_images')
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_random_image
    response = connection.get('/api/v1/inspiration')
    JSON.parse(response.body, symbolize_names: true)
  end
end
