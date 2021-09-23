class ArtPiecesController < ApplicationController

  def new
    @artist = UserArtistsFacade.artist(current_user.id, params[:artist_id])
  end

  def create
    artist = UserArtistsFacade.artist(current_user.id, params[:artist_id])
    image = params[:image_upload]
    md5_hash = Digest::MD5.base64digest(image.read)
    presigned_params = {
      filename: image.original_filename,
      byte_size: image.size,
      checksum: md5_hash,
      content_type: image.content_type,
      metadata: {}
    }
    presigned_response = BackendService.request_presigned_url(presigned_params)
    sleep 5
    presigned_url = presigned_response[:direct_upload][:url]
    blob = presigned_response[:blob_signed_id]
    Faraday.put(presigned_url) do |req|
      req.headers['Content-Type'] = image.content_type
      req.headers['Content-MD5'] = md5_hash
      req.body = image.read
    end
    params_hash = {
      title: params[:art_piece_title],
      description: params[:art_piece_description],
      image: blob
    }
    BackendService.create_image(current_user.id, artist.id, params_hash)
  end


  private

  def artist_params
    params.permit(:username, :password, :password_confirmation, :user_id)
  end

  def image_params
    params.permit(:art_piece_title, :art_piece_description)
  end
end
