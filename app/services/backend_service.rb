class BackendService
  def self.connection
    Faraday.new('https://tikiarte-be.herokuapp.com')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/sessions/create') do |req|
      req.headers['Content-Type'] = 'application/json'
      req.body = {director: user_info}.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.find_user_by_id(user_id)
    response = connection.get('/api/v1/users', user_id)
    JSON.parse(response.body, symbolize_names: true)
  end
end
