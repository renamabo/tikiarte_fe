class UserArtistsFacade
  def self.create(input)
    artist_info = {
      artist: {
        username: input[:username],
        password: input[:password]
      }
    }
    BackendService.create_user_artist(artist_info)
  end

  def self.artists
    json = BackendService.get_artists
    json[:data][:artists].map do |artist|
      Artist.new(artist)
    end
  end
end
