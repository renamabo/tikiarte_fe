require 'rails_helper'

RSpec.describe "artist show page", :vcr do
  before(:each) do
    @user = GoogleUser.new( { id: 1, attributes: { email: 'test@test.com' } } )
    @artist = Artist.new(username: 'tiki14')

    allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(@user)

    # visit user_artist_path(@user.id, @artist.username)
  end

  describe 'display' do
    it 'shows header' do
      # mock_response = "{\"data\":[{\"id\":1,\"attributes\":{\"status\":\"public\",\"url\":\"/app/images/face.png\",\"artist_id\":1}},{\"id\":2,\"attributes\":{\"status\":\"public\",\"url\":\"/app/images/Reggie.JPG\",\"artist_id\":2}},{\"id\":3,\"attributes\":{\"status\":\"public\",\"url\":\"/app/images/turlte.jpg\",\"artist_id\":3}}]}"
      #
      # allow_any_instance_of(Faraday::Connection).to receive(:get).and_return(Faraday::Response.new)
      # allow_any_instance_of(Faraday::Response).to receive(:body).and_return(mock_response)

      visit user_artist_path(@user.id, @artist.username)

      within('#header') do
        expect(page).to have_content('My Artists')
      end
    end
  end
end
