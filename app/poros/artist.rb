class Artist
  attr_reader :username,
              :id

  def initialize(artist_info)
    @username = artist_info[:username]
    @id = artist_info[:id]
  end
end
