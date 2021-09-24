# frozen_string_literal: true

class Artist
  attr_reader :username,
              :id

  def initialize(username, id)
    @username = username
    @id = id
  end
end
