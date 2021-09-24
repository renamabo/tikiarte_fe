class UserArtistsFacade
  def self.create(input)
    artist_info = {
      artist: {
        username: input[:username],
        password: input[:password]
      }
    }
    BackendService.create_user_artist(artist_info, input[:user_id])
  end

  def self.artists(user_id)
    json = BackendService.get_artists(user_id)
    json[:data][:attributes][:artists].map do |artist|
      Artist.new(artist[:username], artist[:id])
    end
  end

  def self.artist(user_id, id)
    json = BackendService.get_artist(user_id, id)
    artist = json[:data]
    Artist.new(artist[:attributes][:username], artist[:id])
  end

  def self.update(input, id)
    artist_info = {
      artist: {
        username: input[:username],
        password: input[:password]
      }
    }
    BackendService.update_user_artist(artist_info, input[:user_id], id)
  end

  def self.delete(user_id, artist_id)
    BackendService.delete_user_artist(user_id, artist_id)
  end
end
