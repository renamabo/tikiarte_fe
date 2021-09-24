class ArtPiecesFacade
  class << self
    def upload_request(input)
      {
        title: input[:title],
        description: input[:description]
      }
      BackendService.request_presigned_url
    end
  end
end
