class Artist
  attr_reader :username

  def initialize(artist_info)
    @username = artist_info[:username]
  end
end
