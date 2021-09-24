class ArtPiecesFacade
  class << self
    def upload_request(input)
      art_piece_info = {
        title: input[:title],
        description: input[:description]
      }
      BackendService.request_presigned_url
    end
  end
end
