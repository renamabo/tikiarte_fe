class BackendService
  def self.connection
    Faraday.new('HEROKU?')
  end

  def self.create_or_find_user(user_info)
    response = connection.post('/api/v1/SOMETHING', user_info)
    JSON.parse(response.body, symbolize_names: true)
  end
end

# other methods we might want:
# find_by_uid(id)
# update_user(user_info) if needed
